# Task 05 - Linux Server & Nginx Reverse Proxy

## 1. Linux Hardening
- Created non-root user `deploy` with sudo access
- Disabled password authentication in /etc/ssh/sshd_config
- Disabled root login

## 2. UFW Firewall
- sudo ufw allow 22,80,443 only
- Default deny incoming

## 3. Nginx Reverse Proxy Features Implemented
- Gzip: Enabled with level 6 for text, json, js, css
- Caching: 1 year expires for static assets with Cache-Control public, immutable
- Rate Limiting: 10 requests/sec per IP using limit_req_zone
- SSL Termination: Configured 443 with self-signed cert (Certbot for prod: sudo certbot --nginx -d example.com)

## 4. Expected Proof Files
- nginx.conf (this file)
- linux-setup.sh
- This documentation

To test: sudo nginx -t && sudo systemctl reload nginx
