# Dell XPS 9500 Hackintosh

| Specification       | Details                           |
| ------------------- | --------------------------------- |
| Model               | Dell XPS 9500 P91F001             |
| Processor           | Intel Core i7-10750H              |
| Integrated Graphics | Intel UHD Graphics 630            |
| RAM                 | 16GB DDR4-2933MHz, 2x8G           |
| Storage             | Western Digital PC SN530 NVMe SSD |
| Sound Card          | Realtek ALC???                    |
| Wireless Card       | Killer(R) Wi-Fi 6 AX1650          |
| SD Card Reader      | ???                               |

#### Instructions

- Follow this [guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#generate-a-new-serial) to generate a new serial number and put that in `src/smbios.txt` (see `smbios-sample.txt`)
- Run `./download.sh` to download necessary kernel extensions
- Run `.build.sh` to build EFI folder

#### Notes

- `download.sh` will download Catalina version of `AirportItlwm`. If you use Big Sur, you need to manually download Big Sur version.
