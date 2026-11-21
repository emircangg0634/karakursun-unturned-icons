# KaraKurşun Unturned Eşya İkonları CDN Deposu

Bu depo, **KaraKurşun.Menu** OpenMod eklentisindeki Kit kartlarının Unturned eşya ikonlarını (`EffectManager.sendUIEffectImageURL`) dinamik olarak çekebilmesi için hazırlanmıştır.

## Yapı
Tüm Unturned eşya ikonları `icons/<ItemId>.png` formatında saklanır:
```text
https://raw.githubusercontent.com/emircangg0634/karakursun-unturned-icons/main/icons/{ItemId}.png
```

## Yeni Mod Silahı / Aleti İkonu Ekleme
Sonradan kite yeni silahlar, tıbbi malzemeler veya Workshop mod eşyaları eklediğinizde:
1. `Export-UnturnedIcons.ps1 -IncludeWorkshop` scriptini çalıştırın.
2. Oluşan `icons/<ItemId>.png` dosyalarını bu deponun `icons/` klasörüne yükleyin.
3. `configs/kits.yaml` içine yalnızca `ItemId` ve `Amount` yazmanız yeterlidir; ikon otomatik çekilir.
