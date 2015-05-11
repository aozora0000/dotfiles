#################################
# pw {int}
#################################
function pw() {
    LENGTH=${1:-16}
    ruby -e "puts Array.new((${LENGTH} || 32).to_i){ rand(62) }.pack(%q!C*!).tr(%Q!\x00-\x3e!, %q!A-Za-z0-9!)"
}
