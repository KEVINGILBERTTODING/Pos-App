class EndPoint {
  static final ip_address = '192.168.43.215';
  // static final ip_address = '192.168.18.113';

  static final api_service = 'http://$ip_address:8000/api/';
  static final base_url = 'http://$ip_address:8000';
  static final auth_endpoint = api_service + 'auth';
  static final profile_endpoint = api_service + 'profile/';
  static final update_profile_endpoint = api_service + 'profile/update/';
}
