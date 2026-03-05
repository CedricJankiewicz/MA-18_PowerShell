$base = "C:\bureau"

New-Item -Path "$base\Pableau_Excobar" -ItemType Directory -Force

New-Item -Path "$base\Pableau_Excobar\Clients" -ItemType Directory -Force
New-Item -Path "$base\Pableau_Excobar\Clients\Epstein" -ItemType Directory -Force
New-Item -Path "$base\Pableau_Excobar\Clients\Léo" -ItemType Directory -Force
New-Item -Path "$base\Pableau_Excobar\Clients\Sofian" -ItemType Directory -Force

New-Item -Path "$base\Pableau_Excobar\Fournisseurs" -ItemType Directory -Force
New-Item -Path "$base\Pableau_Excobar\Colombie" -ItemType Directory -Force
New-Item -Path "$base\Pableau_Excobar\Myanmar" -ItemType Directory -Force


New-Item -Path "$base\Pableau_Excobar\Livraison" -ItemType Directory -Force
New-Item -Path "$base\Pableau_Excobar\Livraison\DPD" -ItemType Directory -Force
New-Item -Path "$base\Pableau_Excobar\Livraison\DHL" -ItemType Directory -Force
