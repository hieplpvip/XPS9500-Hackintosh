# Dell XPS 9500 Hackintosh

| Specification       | Details                                 |
| ------------------- | --------------------------------------- |
| Model               | Dell XPS 9500                           |
| Processor           | Intel Core i7-10750H                    |
| Integrated Graphics | Intel UHD Graphics 630                  |
| Memory              | 16GB RAM & 256GB SSD                    |
| Sound Card          | Conexant CX8200                         |
| Wireless Card       | Intel(R) Dual Band Wireless-AC 8265     |
| SD Card Reader      | Realtek RTS522A PCI Express Card Reader |

#### Instructions

- Follow this [guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#generate-a-new-serial) to generate a new serial number and put that in `src/smbios.txt` (see `smbios-sample.txt`)
- Run `./download.sh` to download necessary kernel extensions
- Run `.build.sh` to build EFI folder

#### Notes

- `download.sh` will download Catalina version of `AirportItlwm`. If you use Big Sur, you need to manually download Big Sur version.
