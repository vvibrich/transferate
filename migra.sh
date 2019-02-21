dialog --title --menu 0 0 0 Host-To-Host 'Migra de um server pro outro'
pick=$( dialog --stdout --menu 'Deseja migrar conteúdo host-to-host?' 0 0 0   1 Sim 2 Não )

case $pick in
1)
        #Origem
        hostO=$( dialog --stdout --inputbox 'Digite o host de origem:' 0 0 )
        userO=$( dialog --stdout --inputbox 'Digite o usuário de origem:' 0 0 )
        passO=$( dialog --stdout --passwordbox 'Digite a senha de origem:' 0 0 )
        content=$( dialog --stdout --inputbox 'Qual arquivo ou diretório quer migrar:' 0 0 )
        #Destino
        hostD=$( dialog --stdout --inputbox 'Digite o host de destino:' 0 0 )
        userD=$( dialog --stdout --inputbox 'Digite o usuário de destino:' 0 0 )
        passD=$( dialog --stdout --passwordbox 'Digite a senha de destino:' 0 0 )
        destino=$( dialog --stdout --inputbox 'Digite para qual diretório quer migrar:' 0 0 )
        #Onde a mágica acontece
        sshpass -p $passO scp -r $userO@$hostO:~/$content .
        sshpass -p $passD scp -r ./$content $userD@$hostD:~/$destino
        rm -rf $content
        dialog --title 'Migrou' --msgbox 'Migração concluida com sucesso' 6 40
        clear

;;
2)
        dialog --title 'Até mais' --msgbox 'Perfeito, até mais \o/' 6 40
;;
esac
