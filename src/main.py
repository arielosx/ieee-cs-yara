# -*- coding: utf-8 -*-
import yara
import os       #sys e os foram importados junto com a regra para ajudar o arquivo a rodar em qualquer pasta/local
import sys

def escanear_arquivo(filepath: str, rules: yara.Rule):
    """
    Escaneia um unico arquivo com base na regra Yara.
    """
    try:
        matches = rules.match(filepath)

        if matches:
            print(f"‼️ Possivel arquivo malicioso encontrado: {filepath}")
            for match in matches:
                print(f"  Regra: {match.rule}")     
                for s in match.strings:
                    for instance in s.instances:
                        print(f"    String {s.identifier} encontrada no offset {instance.offset}")
        else:
            print(f"✅  Nenhuma ameaca encontrada em: {filepath}")

    except yara.Error as e:
        print(f"Erro ao escanear: {e}")
    except FileNotFoundError:
        print(f"Erro: Arquivo nao encontrado em {filepath}")

if __name__ == "__main__":
    try:
        src = os.path.dirname(sys.argv[0]) + '/..'
        malwares_file =  src + "/test_rules/virus.bat"
        rules_file =  src + "/rules/virus_simulado_bat.yara"
        
        if os.path.exists(malwares_file):
            yara_rules = yara.compile(rules_file)
            escanear_arquivo(malwares_file, yara_rules)
        else:
            print(f"❌ Erro: Arquivo 'virus.bat' nao encontrado.")
            print(f"   Certifique-se que 'virus.bat' esta na mesma pasta que este script.")
            print(f"   Pasta atual: {src}")

    except yara.Error as e:
        print(f"Erro ao compilar a regra Yara: {e}")
    except Exception as e:
        print(f"Ocorreu um erro inesperado: {e}")