# TMD - Termux para devs
# Código de origem: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master

#---------------------------------------------------------------------------------
# Iniciando 
echo -e "\e[35;1m TMD - customizando o zsh...\e[0m"

# Este script verifica se o git está instalado no sistema. Caso não esteja, 
# ele faz a instalação do git usando o comando pkg install git -y. 
# Este script é útil para garantir que o git esteja disponível antes de continuar 
# com as operações do script, evitando erros. É importante lembrar de ler e entender 
# o script antes de executá-lo, pois ele faz modificações no sistema e pode causar 
# problemas se usado de forma inorreta.

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  echo 'Installing git...'
  pkg install git -y
else
  echo 'git is already installed.'
fi

# Esse script verifica que o zsh já está instalado, caso contrário
# Ele efetua o procedimento de instalação do ZSH

if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: zsh is not installed.' >&2
  echo 'Installing zsh...'
  pkg install zsh -y
else
  echo 'zsh is already installed.'
fi

# Esse script verifica se o oh-my-zsh está inslado
# Caso não esteja, ele faz a instalação
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zsh is not installed."
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "oh-my-zsh is already installed."
fi


# Realizando o procedimento de clone e instalação\configuração dos recursos
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Configura o .zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

echo -e "\e[35;1m TMD - customização do ZSH concluída! Reinicie e seção para validar as alterações.\e[0m"

