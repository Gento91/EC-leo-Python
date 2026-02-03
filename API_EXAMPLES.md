# 📡 Exemples d'utilisation de l'API

## Base URL
```
http://localhost:8000
```

## Endpoints disponibles

### 1. Health Check

Vérifier que l'API fonctionne.

**Request:**
```http
GET /health
```

**Response:**
```json
{
  "status": "ok",
  "message": "API is running"
}
```

**Exemple curl:**
```bash
curl http://localhost:8000/health
```

---

### 2. Obtenir les services d'un business

Récupère tous les services actifs d'un business.

**Request:**
```http
GET /api/services/{business_id}
```

**Paramètres:**
- `business_id` (path) : ID du business

**Response:**
```json
[
  {
    "id": 1,
    "name": "Massage relaxant",
    "description": "Massage de 45 minutes pour se détendre",
    "duration_minutes": 45,
    "price_cents": 5000
  },
  {
    "id": 2,
    "name": "Coupe de cheveux",
    "description": "Coupe et brushing",
    "duration_minutes": 30,
    "price_cents": 3500
  }
]
```

**Exemple curl:**
```bash
curl http://localhost:8000/api/services/1
```

**Exemple JavaScript:**
```javascript
fetch('http://localhost:8000/api/services/1')
  .then(response => response.json())
  .then(services => {
    console.log('Services disponibles:', services);
  });
```

---

### 3. Calculer les créneaux disponibles ⭐

Endpoint principal : calcule tous les créneaux disponibles pour un service à une date donnée.

**Request:**
```http
POST /api/slots/available
Content-Type: application/json
```

**Body:**
```json
{
  "business_id": 1,
  "service_id": 1,
  "date": "2026-02-04",
  "granularity_minutes": 15
}
```

**Paramètres:**
- `business_id` (required) : ID du business
- `service_id` (required) : ID du service
- `date` (required) : Date au format YYYY-MM-DD
- `granularity_minutes` (optional) : Granularité en minutes (défaut: 15)

**Response (Succès - 200):**
```json
{
  "date": "2026-02-04",
  "service_id": 1,
  "service_name": "Massage relaxant",
  "duration_minutes": 45,
  "available_slots": [
    {
      "start_time": "2026-02-04T09:00:00",
      "end_time": "2026-02-04T09:45:00",
      "staff_id": 1,
      "staff_name": "Jean Dupont"
    },
    {
      "start_time": "2026-02-04T09:15:00",
      "end_time": "2026-02-04T10:00:00",
      "staff_id": 2,
      "staff_name": "Marie Martin"
    },
    {
      "start_time": "2026-02-04T10:00:00",
      "end_time": "2026-02-04T10:45:00",
      "staff_id": 1,
      "staff_name": "Jean Dupont"
    }
  ],
  "total_slots": 3
}
```

**Response (Erreur - 404):**
```json
{
  "detail": {
    "error": "ServiceNotFound",
    "message": "Le service avec l'ID 999 n'existe pas ou n'est pas actif"
  }
}
```

**Exemple curl:**
```bash
curl -X POST http://localhost:8000/api/slots/available \
  -H "Content-Type: application/json" \
  -d '{
    "business_id": 1,
    "service_id": 1,
    "date": "2026-02-04",
    "granularity_minutes": 15
  }'
```

**Exemple JavaScript:**
```javascript
const data = {
  business_id: 1,
  service_id: 1,
  date: '2026-02-04',
  granularity_minutes: 15
};

fetch('http://localhost:8000/api/slots/available', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify(data)
})
  .then(response => response.json())
  .then(result => {
    console.log(`${result.total_slots} créneaux disponibles`);
    result.available_slots.forEach(slot => {
      console.log(`${slot.start_time} - ${slot.staff_name}`);
    });
  });
```

**Exemple Python:**
```python
import requests
from datetime import date, timedelta

# Date de demain
tomorrow = date.today() + timedelta(days=1)

payload = {
    "business_id": 1,
    "service_id": 1,
    "date": tomorrow.isoformat(),
    "granularity_minutes": 15
}

response = requests.post(
    "http://localhost:8000/api/slots/available",
    json=payload
)

if response.status_code == 200:
    data = response.json()
    print(f"{data['total_slots']} créneaux disponibles")
    for slot in data['available_slots']:
        print(f"{slot['start_time']} avec {slot['staff_name']}")
else:
    print(f"Erreur: {response.status_code}")
```

---

## Cas d'usage

### Cas 1 : Afficher les créneaux du jour suivant

```javascript
const tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);
const dateStr = tomorrow.toISOString().split('T')[0];

fetch('http://localhost:8000/api/slots/available', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    business_id: 1,
    service_id: 1,
    date: dateStr,
    granularity_minutes: 15
  })
})
  .then(res => res.json())
  .then(data => {
    console.log(`${data.total_slots} créneaux disponibles demain`);
  });
```

### Cas 2 : Créneaux pour toute une semaine

```javascript
async function getSlotsForWeek(businessId, serviceId) {
  const today = new Date();
  const promises = [];
  
  for (let i = 1; i <= 7; i++) {
    const date = new Date(today);
    date.setDate(today.getDate() + i);
    const dateStr = date.toISOString().split('T')[0];
    
    promises.push(
      fetch('http://localhost:8000/api/slots/available', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          business_id: businessId,
          service_id: serviceId,
          date: dateStr,
          granularity_minutes: 15
        })
      }).then(res => res.json())
    );
  }
  
  const results = await Promise.all(promises);
  
  results.forEach(result => {
    console.log(`${result.date}: ${result.total_slots} créneaux`);
  });
}

getSlotsForWeek(1, 1);
```

### Cas 3 : Vérifier la disponibilité d'un créneau spécifique

```javascript
async function isSlotAvailable(businessId, serviceId, date, startTime) {
  const response = await fetch('http://localhost:8000/api/slots/available', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      business_id: businessId,
      service_id: serviceId,
      date: date,
      granularity_minutes: 15
    })
  });
  
  const data = await response.json();
  
  // Chercher si le créneau existe
  const slot = data.available_slots.find(s => 
    s.start_time.includes(startTime)
  );
  
  return slot ? true : false;
}

// Utilisation
isSlotAvailable(1, 1, '2026-02-04', '09:00:00').then(available => {
  console.log(available ? 'Créneau disponible' : 'Créneau occupé');
});
```

### Cas 4 : Grouper les créneaux par employé

```javascript
async function getSlotsByStaff(businessId, serviceId, date) {
  const response = await fetch('http://localhost:8000/api/slots/available', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      business_id: businessId,
      service_id: serviceId,
      date: date,
      granularity_minutes: 15
    })
  });
  
  const data = await response.json();
  
  // Grouper par employé
  const byStaff = {};
  data.available_slots.forEach(slot => {
    if (!byStaff[slot.staff_name]) {
      byStaff[slot.staff_name] = [];
    }
    byStaff[slot.staff_name].push(slot);
  });
  
  return byStaff;
}

// Utilisation
getSlotsByStaff(1, 1, '2026-02-04').then(byStaff => {
  Object.entries(byStaff).forEach(([staff, slots]) => {
    console.log(`${staff}: ${slots.length} créneaux`);
  });
});
```

### Cas 5 : Créneaux avec granularité de 30 minutes

```bash
curl -X POST http://localhost:8000/api/slots/available \
  -H "Content-Type: application/json" \
  -d '{
    "business_id": 1,
    "service_id": 1,
    "date": "2026-02-04",
    "granularity_minutes": 30
  }'
```

---

## Codes de retour HTTP

| Code | Signification | Exemple |
|------|--------------|---------|
| 200 | Succès | Créneaux calculés avec succès |
| 404 | Non trouvé | Service inexistant |
| 400 | Requête invalide | Date mal formatée |
| 500 | Erreur serveur | Problème de connexion DB |

---

## Intégration avec des frameworks

### React

```jsx
import { useState, useEffect } from 'react';

function BookingCalendar() {
  const [slots, setSlots] = useState([]);
  const [loading, setLoading] = useState(false);
  
  const fetchSlots = async (date) => {
    setLoading(true);
    try {
      const response = await fetch('http://localhost:8000/api/slots/available', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          business_id: 1,
          service_id: 1,
          date: date,
          granularity_minutes: 15
        })
      });
      
      const data = await response.json();
      setSlots(data.available_slots);
    } catch (error) {
      console.error('Erreur:', error);
    } finally {
      setLoading(false);
    }
  };
  
  return (
    <div>
      {loading ? (
        <p>Chargement...</p>
      ) : (
        <ul>
          {slots.map(slot => (
            <li key={slot.start_time}>
              {slot.start_time} - {slot.staff_name}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
```

### Vue.js

```vue
<template>
  <div>
    <ul v-if="!loading">
      <li v-for="slot in slots" :key="slot.start_time">
        {{ slot.start_time }} - {{ slot.staff_name }}
      </li>
    </ul>
    <p v-else>Chargement...</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      slots: [],
      loading: false
    };
  },
  methods: {
    async fetchSlots(date) {
      this.loading = true;
      try {
        const response = await fetch('http://localhost:8000/api/slots/available', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            business_id: 1,
            service_id: 1,
            date: date,
            granularity_minutes: 15
          })
        });
        
        const data = await response.json();
        this.slots = data.available_slots;
      } catch (error) {
        console.error('Erreur:', error);
      } finally {
        this.loading = false;
      }
    }
  }
};
</script>
```

---

## Documentation interactive

FastAPI génère automatiquement une documentation interactive où vous pouvez tester les endpoints directement :

- **Swagger UI** : http://localhost:8000/docs
- **ReDoc** : http://localhost:8000/redoc

Ces interfaces permettent de :
- Voir tous les endpoints
- Tester les requêtes
- Voir les schémas de données
- Télécharger le schéma OpenAPI

---

## Conseils d'utilisation

### 1. Gestion des erreurs

Toujours vérifier le statut de la réponse :

```javascript
const response = await fetch(url, options);

if (!response.ok) {
  const error = await response.json();
  console.error('Erreur API:', error.detail);
  return;
}

const data = await response.json();
```

### 2. Optimisation

Pour éviter les requêtes multiples, utilisez un cache côté client :

```javascript
const cache = new Map();

async function getCachedSlots(key, fetchFn) {
  if (cache.has(key)) {
    return cache.get(key);
  }
  
  const data = await fetchFn();
  cache.set(key, data);
  
  return data;
}
```

### 3. Timeout

Ajoutez un timeout pour les requêtes lentes :

```javascript
const controller = new AbortController();
const timeoutId = setTimeout(() => controller.abort(), 5000);

try {
  const response = await fetch(url, {
    signal: controller.signal,
    ...options
  });
} catch (error) {
  if (error.name === 'AbortError') {
    console.error('Requête annulée (timeout)');
  }
} finally {
  clearTimeout(timeoutId);
}
```

---

## Authentification (future)

Pour sécuriser l'API en production, vous pourrez ajouter l'authentification JWT :

```javascript
const token = localStorage.getItem('auth_token');

fetch('http://localhost:8000/api/slots/available', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${token}`
  },
  body: JSON.stringify(data)
});
```

---

## Contact

Pour plus d'informations, consultez :
- README.md
- ARCHITECTURE.md
- http://localhost:8000/docs
