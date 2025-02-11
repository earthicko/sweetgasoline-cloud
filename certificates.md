Let’s Encrypt is a free, automated, and open certificate authority. It’s widely used and well-supported.

Steps:
Install Certbot: Certbot is the official Let's Encrypt client.

```bash
sudo apt update
sudo apt install certbot
sudo apt install python3-certbot-nginx
```
Generate Certificates: Use Certbot to generate the SSL certificate for your domain:

```bash
sudo certbot certonly --standalone -d work.sweetgasoline.kr
```
Replace sweetgasoline.kr with your Nextcloud server's domain name.

Locate the Certificates: After successful certificate generation, the certificates will be located in:

Private key: /etc/letsencrypt/live/sweetgasoline.kr/privkey.pem
Fullchain: /etc/letsencrypt/live/sweetgasoline.kr/fullchain.pem
Copy Certificates: Create the certs folder in your project and copy the certificates:

bash
코드 복사
mkdir certs
cp /etc/letsencrypt/live/work.sweetgasoline.kr/privkey.pem certs/
cp /etc/letsencrypt/live/work.sweetgasoline.kr/fullchain.pem certs/
Setup Renewal: Let’s Encrypt certificates expire every 90 days. To renew them automatically:

bash
코드 복사
sudo certbot renew --dry-run