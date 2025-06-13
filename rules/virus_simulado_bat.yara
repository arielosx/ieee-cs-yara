rule VirusSimuladoBat
{
    meta:
        autor = "Grupo 1"
        descricao = "Detecta o script de lote de simulacao de virus"

    strings:
        // Identificador unico no script .bat
        $assinatura = "ASSINATURA_VIRUS_XYZ789"

        // Comandos comuns usados no script para efeitos visuais
        $cmd_color = "color"
        $cmd_title = "title" //strings que a regra yara vai procurar para definir se é falso positivo ou não
        $cmd_start = "start"
        $cmd_echo="echo Todos os seus arquivos pertencem a nos"

    condition:
        // O arquivo deve conter a assinatura unica e pelo menos 3 das outras strings
        $assinatura and 3 of ($cmd*)  //condições para ser definido como virus - assinatura e 3 strings que altere o cmd
}
