COOKIES_DOMAIN = ".#{ENV['APP_HOST'].sub /:.*/, ''}"
RESERVED_SUBDOMAINS = ['admin', 'avatars', 'login', 'www']
EMAIL_REGEX = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}/i
