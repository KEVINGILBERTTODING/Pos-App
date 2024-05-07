class EndPoint {
  // static final ip_address = '192.168.43.215';
  static final ip_address = '192.168.18.113';
  // static final ip_address = '192.168.1.10'; // wifi kos

  static final api_service = 'http://$ip_address:8000/api/';
  static final base_url = 'http://$ip_address:8000';
  static final auth_endpoint = api_service + 'auth';
  static final profile_endpoint = api_service + 'profile/';
  static final update_profile_endpoint = api_service + 'profile/update/';
  static final category_endpoint = api_service + 'category/';
  static final product_endpoint = api_service + 'product';
  static final member_endpoint = api_service + 'member';
  static final app_endpoint = api_service + 'setting';
}
