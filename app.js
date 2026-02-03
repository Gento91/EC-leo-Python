// Configuration de l'API
const API_BASE_URL = 'http://localhost:8000';

// Éléments DOM
const slotForm = document.getElementById('slotForm');
const businessIdInput = document.getElementById('business_id');
const serviceSelect = document.getElementById('service_id');
const dateInput = document.getElementById('date');
const granularitySelect = document.getElementById('granularity');
const loadingDiv = document.getElementById('loading');
const errorDiv = document.getElementById('error');
const modal = document.getElementById('slotsModal');
const modalClose = document.querySelector('.close');
const modalInfo = document.getElementById('modalInfo');
const slotsContainer = document.getElementById('slotsContainer');

// État de l'application
let currentSlots = [];

// Initialisation
document.addEventListener('DOMContentLoaded', () => {
    // Définir la date par défaut à demain
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    dateInput.value = tomorrow.toISOString().split('T')[0];
    
    // Charger les services
    loadServices();
    
    // Event listeners
    slotForm.addEventListener('submit', handleFormSubmit);
    modalClose.addEventListener('click', closeModal);
    businessIdInput.addEventListener('change', loadServices);
    
    // Fermer la modal en cliquant en dehors
    window.addEventListener('click', (e) => {
        if (e.target === modal) {
            closeModal();
        }
    });
});

// Charger la liste des services
async function loadServices() {
    const businessId = businessIdInput.value;
    
    if (!businessId) {
        return;
    }
    
    try {
        serviceSelect.innerHTML = '<option value="">Chargement...</option>';
        
        const response = await fetch(`${API_BASE_URL}/api/services/${businessId}`);
        
        if (!response.ok) {
            throw new Error('Impossible de charger les services');
        }
        
        const services = await response.json();
        
        if (services.length === 0) {
            serviceSelect.innerHTML = '<option value="">Aucun service disponible</option>';
            return;
        }
        
        serviceSelect.innerHTML = '<option value="">Sélectionnez un service</option>';
        services.forEach(service => {
            const option = document.createElement('option');
            option.value = service.id;
            option.textContent = `${service.name} (${service.duration_minutes} min)`;
            option.dataset.duration = service.duration_minutes;
            serviceSelect.appendChild(option);
        });
        
    } catch (error) {
        console.error('Erreur lors du chargement des services:', error);
        serviceSelect.innerHTML = '<option value="">Erreur de chargement</option>';
        showError('Impossible de charger les services. Vérifiez que l\'API est démarrée.');
    }
}

// Gérer la soumission du formulaire
async function handleFormSubmit(e) {
    e.preventDefault();
    
    hideError();
    
    const formData = {
        business_id: parseInt(businessIdInput.value),
        service_id: parseInt(serviceSelect.value),
        date: dateInput.value,
        granularity_minutes: parseInt(granularitySelect.value)
    };
    
    // Validation
    if (!formData.service_id) {
        showError('Veuillez sélectionner un service');
        return;
    }
    
    if (!formData.date) {
        showError('Veuillez sélectionner une date');
        return;
    }
    
    await fetchAvailableSlots(formData);
}

// Récupérer les créneaux disponibles depuis l'API
async function fetchAvailableSlots(data) {
    showLoading();
    
    try {
        const response = await fetch(`${API_BASE_URL}/api/slots/available`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data)
        });
        
        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData.detail?.message || 'Une erreur est survenue');
        }
        
        const result = await response.json();
        currentSlots = result.available_slots;
        
        hideLoading();
        displaySlots(result);
        
    } catch (error) {
        console.error('Erreur:', error);
        hideLoading();
        showError(error.message || 'Impossible de récupérer les créneaux disponibles');
    }
}

// Afficher les créneaux dans la modal
function displaySlots(data) {
    // Mettre à jour les informations
    const formattedDate = new Date(data.date).toLocaleDateString('fr-FR', {
        weekday: 'long',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
    });
    
    modalInfo.innerHTML = `
        <p><strong>Service :</strong> ${data.service_name}</p>
        <p><strong>Durée :</strong> ${data.duration_minutes} minutes</p>
        <p><strong>Date :</strong> ${formattedDate}</p>
        <p><strong>Créneaux disponibles :</strong> ${data.total_slots}</p>
    `;
    
    // Afficher les créneaux
    if (data.available_slots.length === 0) {
        slotsContainer.innerHTML = `
            <div class="no-slots">
                <div class="no-slots-icon">😕</div>
                <p>Aucun créneau disponible pour cette date.</p>
                <p>Essayez une autre date ou un autre service.</p>
            </div>
        `;
    } else {
        slotsContainer.innerHTML = '';
        
        data.available_slots.forEach(slot => {
            const slotCard = createSlotCard(slot);
            slotsContainer.appendChild(slotCard);
        });
    }
    
    // Ouvrir la modal
    openModal();
}

// Créer une carte de créneau
function createSlotCard(slot) {
    const card = document.createElement('div');
    card.className = 'slot-card';
    
    const startTime = new Date(slot.start_time).toLocaleTimeString('fr-FR', {
        hour: '2-digit',
        minute: '2-digit'
    });
    
    const endTime = new Date(slot.end_time).toLocaleTimeString('fr-FR', {
        hour: '2-digit',
        minute: '2-digit'
    });
    
    card.innerHTML = `
        <div>
            <div class="slot-time">${startTime} - ${endTime}</div>
            <div class="slot-staff">👤 ${slot.staff_name}</div>
        </div>
        <div class="slot-icon">✓</div>
    `;
    
    card.addEventListener('click', () => {
        selectSlot(slot);
    });
    
    return card;
}

// Sélectionner un créneau
function selectSlot(slot) {
    const startTime = new Date(slot.start_time).toLocaleTimeString('fr-FR', {
        hour: '2-digit',
        minute: '2-digit'
    });
    
    const endTime = new Date(slot.end_time).toLocaleTimeString('fr-FR', {
        hour: '2-digit',
        minute: '2-digit'
    });
    
    const confirmed = confirm(
        `Voulez-vous réserver ce créneau ?\n\n` +
        `⏰ ${startTime} - ${endTime}\n` +
        `👤 ${slot.staff_name}\n\n` +
        `Note: Cette fonctionnalité de réservation sera implémentée prochainement.`
    );
    
    if (confirmed) {
        console.log('Créneau sélectionné:', slot);
        // Ici, vous pouvez ajouter la logique pour créer le rendez-vous
    }
}

// Fonctions utilitaires pour la modal
function openModal() {
    modal.style.display = 'block';
    document.body.style.overflow = 'hidden';
}

function closeModal() {
    modal.style.display = 'none';
    document.body.style.overflow = 'auto';
}

// Fonctions utilitaires pour l'affichage
function showLoading() {
    loadingDiv.style.display = 'block';
}

function hideLoading() {
    loadingDiv.style.display = 'none';
}

function showError(message) {
    errorDiv.textContent = message;
    errorDiv.style.display = 'block';
    
    // Faire défiler vers l'erreur
    errorDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
}

function hideError() {
    errorDiv.style.display = 'none';
    errorDiv.textContent = '';
}
