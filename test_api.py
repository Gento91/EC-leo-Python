"""
Script de test pour vérifier le bon fonctionnement de l'API
"""
import requests
from datetime import date, timedelta
import json

API_BASE_URL = "http://localhost:8000"

def test_health():
    """Test de santé de l'API"""
    print("🔍 Test de santé de l'API...")
    try:
        response = requests.get(f"{API_BASE_URL}/health")
        if response.status_code == 200:
            print("✅ API en ligne")
            return True
        else:
            print(f"❌ Échec : code {response.status_code}")
            return False
    except requests.exceptions.ConnectionError:
        print("❌ Impossible de se connecter à l'API")
        print("   Assurez-vous que le serveur est démarré (python main.py)")
        return False

def test_get_services():
    """Test de récupération des services"""
    print("\n🔍 Test de récupération des services...")
    try:
        response = requests.get(f"{API_BASE_URL}/api/services/1")
        if response.status_code == 200:
            services = response.json()
            print(f"✅ {len(services)} service(s) trouvé(s)")
            for service in services:
                print(f"   - {service['name']} ({service['duration_minutes']} min)")
            return len(services) > 0
        else:
            print(f"❌ Échec : code {response.status_code}")
            return False
    except Exception as e:
        print(f"❌ Erreur : {e}")
        return False

def test_get_slots():
    """Test de récupération des créneaux disponibles"""
    print("\n🔍 Test de récupération des créneaux disponibles...")
    
    # Date de demain
    tomorrow = date.today() + timedelta(days=1)
    
    payload = {
        "business_id": 1,
        "service_id": 1,
        "date": tomorrow.isoformat(),
        "granularity_minutes": 15
    }
    
    try:
        response = requests.post(
            f"{API_BASE_URL}/api/slots/available",
            json=payload,
            headers={"Content-Type": "application/json"}
        )
        
        if response.status_code == 200:
            data = response.json()
            print(f"✅ Requête réussie")
            print(f"   Service : {data['service_name']}")
            print(f"   Durée : {data['duration_minutes']} minutes")
            print(f"   Date : {data['date']}")
            print(f"   Créneaux disponibles : {data['total_slots']}")
            
            if data['total_slots'] > 0:
                print("\n   📅 Exemples de créneaux :")
                for i, slot in enumerate(data['available_slots'][:3]):
                    start = slot['start_time'].split('T')[1][:5]
                    end = slot['end_time'].split('T')[1][:5]
                    print(f"      {i+1}. {start} - {end} avec {slot['staff_name']}")
                
                if data['total_slots'] > 3:
                    print(f"      ... et {data['total_slots'] - 3} autre(s) créneau(x)")
            else:
                print("   ℹ️  Aucun créneau disponible (normal si tous les employés sont occupés)")
            
            return True
        else:
            print(f"❌ Échec : code {response.status_code}")
            print(f"   Détails : {response.text}")
            return False
            
    except Exception as e:
        print(f"❌ Erreur : {e}")
        return False

def test_invalid_service():
    """Test avec un service inexistant"""
    print("\n🔍 Test avec service inexistant...")
    
    tomorrow = date.today() + timedelta(days=1)
    
    payload = {
        "business_id": 1,
        "service_id": 99999,  # Service qui n'existe pas
        "date": tomorrow.isoformat(),
        "granularity_minutes": 15
    }
    
    try:
        response = requests.post(
            f"{API_BASE_URL}/api/slots/available",
            json=payload,
            headers={"Content-Type": "application/json"}
        )
        
        if response.status_code == 404:
            print("✅ Erreur 404 correctement retournée pour service inexistant")
            return True
        else:
            print(f"❌ Code attendu 404, reçu {response.status_code}")
            return False
            
    except Exception as e:
        print(f"❌ Erreur : {e}")
        return False

def main():
    """Fonction principale de test"""
    print("=" * 60)
    print("🧪 TESTS DE L'API BOOKERPRO")
    print("=" * 60)
    
    tests = [
        test_health,
        test_get_services,
        test_get_slots,
        test_invalid_service
    ]
    
    results = []
    for test in tests:
        results.append(test())
    
    print("\n" + "=" * 60)
    print("📊 RÉSULTATS")
    print("=" * 60)
    
    passed = sum(results)
    total = len(results)
    
    print(f"\n✅ Tests réussis : {passed}/{total}")
    
    if passed == total:
        print("\n🎉 Tous les tests sont passés avec succès !")
    else:
        print(f"\n⚠️  {total - passed} test(s) ont échoué")
        print("\nConseils de dépannage :")
        print("1. Vérifiez que le serveur est démarré (python main.py)")
        print("2. Vérifiez la connexion à MySQL")
        print("3. Vérifiez que la base de données contient des données")
        print("4. Consultez les logs du serveur pour plus de détails")
    
    print("\n" + "=" * 60)

if __name__ == "__main__":
    main()
