function fn() {
    var env = karate.env || 'dev'
    var config = {};

    if  (env == 'dev') {
        config.servidor = 'https://servidor_DEV/';
        config.artefacto = 'artefacto/';
    } else if (env == 'qa') {
        config.servidor = 'https://servidor_QA/';
        config.artefacto = 'artefacto/';
    } else if (env == 'prod') {
        config.servidor = 'htps://servidor_PROD/';
        config.artefacto = 'artefacto/';
    }

    karate.log('Corriendo en ambiente: ', env);
    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000);

    return config;
}