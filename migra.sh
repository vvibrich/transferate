sudo apt install aptitude
aptitude install sshpass
echo Host de Origem: 
read hostO
echo Usuario Origem: 
read userO
echo Senha de Origem: 
read passO
echo Host de Destino:
read hostD
echo Usuario de Destino: 
read userD
echo Senha de Destino: 
read passD


sshpass -p $passO scp -r $userO@$hostO:~/www .
echo  Baixou 
sshpass -p $passD scp -r ./whois $userD@$hostD:~/www
rm -rf www/
echo Foi migrado

