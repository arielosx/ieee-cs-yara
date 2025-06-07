# <center>PROSEL Computer Society - IEEE Ramo UFBA</center>
## Projeto 2: Mantendo a segurança
> Construção de um verificador de arquivos usando yara-python.
> Vocês irão montar suas próprias regras e fazer a checagem de um arquivo de sua escolha.
> É muito importante explicar o porquê de cada regra e fazer um comparativo com arquivos maliciosos.

### Links Úteis
* [🕵️‍♀️Yara docs](https://yara.readthedocs.io/en/latest/writingrules.html)
* [🐍yara-python docs](https://yara.readthedocs.io/en/latest/yarapython.html)
* [📦Yara rules modules](https://github.com/Yara-Rules/rules)
* [🥷Malware repo](https://github.com/Da2dalus/The-MALWARE-Repo)

### Testando no prompt

1. Instale o [YARA v4.5.4 ](https://github.com/VirusTotal/yara/releases/tag/v4.5.4)
2. Crie uma regra num arquivo `.yar`
3. Execute no terminal: `yara <yara_rule_path> <_another_file_or_folder_path>`

### Testando com yara-python

1. Instale o [yara-python](https://github.com/VirusTotal/yara-python)
2. Crie uma regra num arquivo `.yar`
3. Crie um arquivo `.py`:
```python
import yara
rules = yara.compile('yara/rule/path')
matches = rules.matches('another/file/path')
print(matches)
```

### Contribua com este projeto

1. Clone o repositório: `git clone https://github.com/arielosx/ieee-cs-yara.git`
2. Crie uma branch de trabalho: `git checkout -b <brance_name>`
3. Mapeie suas modificações: `git add .`
4. Commite-as: `git commit -m <commit_description>`
5. Atualize o repositório: `git push origin <branch_name>`
