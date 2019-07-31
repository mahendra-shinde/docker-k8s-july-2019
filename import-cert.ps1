## Import certificate from file 
### STEP1 : Create Cert in local machine in powershell (Administrator mode)
    $cert = New-SelfSignedCertificate -DnsName  myweb.mahendra.com -Friendlyname MyCert -CertStoreLocation Cert:\LocalMachine\My
Export-Certificate -Cert $cert -FilePath c:\certs\user.cer 

## STEP2 : Import cert into container using powershell script
Import-Certificate -FilePath .\user.cer  -CertStoreLocation Cert:\LocalMachine\My -
import-module webadministration
new-item -path IIS:\SslBindings\0.0.0.0!443 -value $cert
New-WebBinding -Name "Default Web Site" -IP "*" -Port 443 -Protocol https
