class EndPoint {
  // static final ip_address = '192.168.43.215'; // hotspot
  // static final ip_address = '192.168.18.113'; // kantor
  static final ip_address = '192.168.1.12'; // wifi kos

  static final api_service = 'http://$ip_address:8000/api/';
  static final base_url = 'http://$ip_address:8000/';
  static final base_url_image = 'http://$ip_address:8000';
  static final base_url_product_image = 'http://$ip_address:8000/data/';
  static final auth_endpoint = api_service + 'auth';
  static final profile_endpoint = api_service + 'profile/';
  static final update_profile_endpoint = api_service + 'profile/update/';
  static final category_endpoints = api_service + 'category';
  static final category_store_endpoints = api_service + 'category/store';
  static final category_destroy_endpoints = api_service + 'category/destroy/';
  static final product_endpoint = api_service + 'product';
  static final product_store_endpoint = api_service + 'product/store/';
  static final member_endpoint = api_service + 'member';
  static final member_store_endpoint = api_service + 'member/store';
  static final member_destroy_endpoint = api_service + 'member/destroy/';
  static final app_endpoint = api_service + 'setting';
  static final store_transaction_endpoint = api_service + 'penjualan/store';
  static final search_product_endpoint = api_service + 'search/product';
  static final nota_transaction_endpoint = base_url + 'nota/';
}
