#TMD - Termux para devs
# Código de origem: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master

#---------------------------------------------------------------------------------
# Iniciando 
echo -e "\e[35;1mTMD iniciando customização...\e[0m"
echo " "

# Este script verifica se o git está instalado no sistema. Caso não esteja, 
# ele faz a instalação do git usando o comando pkg install git -y. 
# Este script é útil para garantir que o git esteja disponível antes de continuar 
# com as operações do script, evitando erros. É importante lembrar de ler e entender 
# o script antes de executá-lo, pois ele faz modificações no sistema e pode causar 
# problemas se usado de forma inorreta.

if ! [ -x "$(command -v git)" ]; then
  echo 'AVISO: git is not installed.' >&2
  echo 'Installing git...'
  pkg install git -y
else
  echo -e " git \e[32;1mok\033[0m"
fi

# Esse script verifica que o zsh já está instalado, caso contrário
# Ele efetua o procedimento de instalação do ZSH

if ! [ -x "$(command -v zsh)" ]; then
  echo 'AVISO: zsh is not installed.' >&2
  echo 'Installing zsh...'
  pkg install zsh -y
else
  echo -e " zsh \e[32;1mok\033[0m"
fi

# Esse script verifica se o oh-my-zsh está inslado
# Caso não esteja, ele faz a instalação
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zsh is not installed."
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo -e " oh-my-zsh \e[32;1mok\033[0m"
fi

zsh
chsh -s $(which zsh)

# -------------------------------------------------------------------------------
# CONFIGURA O ZSH SYNTAX-HIGHLIGHTING
# Realizando o procedimento de clone e instalação\configuração dos recursos
rm -rf ~/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc
echo -e " zsh-syntaxe-high... \e[32;1mok\033[0m"
echo " "

# --------------------------------------------------------------------------------
# INSTALA E CONFIGURA O ZSH AUTOCOMPLETE
# Realiza procedimento de instalação e configuração do plugin de customização do zsh
# que possibilita ter a função de autocomplete com base em histórico de comandos
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc

zsh
chsh -s $(which zsh)

# --------------------------------------------------------------------------------
# CONCLUSÃO DA INSTALAÇÃO
# Finaliza atualização e procediemnto de instalação do ZSH
echo -e "\e[32;1mConcluído!\e[0m"
echo -e 'Reinicie a seção para validar as alterações.'
