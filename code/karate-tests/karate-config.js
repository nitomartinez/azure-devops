function fn() {
    var config = {};

    config.baseUrl = java.lang.System.getenv('API_BASE_URL') || 'http://localhost:8080';
    
    return config;
}
