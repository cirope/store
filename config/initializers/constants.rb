COOKIES_DOMAIN=".#{APPLICATION['host'].sub(/:.*/, '')}"
FOREIGN_KEY_OPTIONS='ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED'
RESERVED_SUBDOMAINS = ['admin', 'avatars', 'www']
