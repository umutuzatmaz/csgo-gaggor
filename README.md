# [CS:GO] GagGör

Susturulmuş (gag'li) oyuncuların sohbete yazdığı mesajları, yetkili adminlerin görebilmesini sağlayan SourceMod eklentisi.

Bir oyuncu gag'liyken mesaj yazdığında, eklenti o mesajı aktif adminlere şu formatta iletir:

```
[Gag'lı Oyuncu] heni: test mesajı
```

---

## Gereksinimler

| Gereksinim | Açıklama |
|---|---|
| [SourceMod](https://www.sourcemod.net/) | 1.10 veya üzeri |
| [BaseComm](https://wiki.alliedmods.net/Base_Communications_(SourceMod)) | SourceMod ile birlikte gelir |
| [ColorVariables](https://github.com/PremyslTalich/ColorVariables) | Sohbet renkleri için (`colorvariables.inc`) |

---

## Kurulum

1. `gaggor.smx` dosyasını `csgo/addons/sourcemod/plugins/` klasörüne koy.
2. `heni_gaggor.phrases.txt` dosyasını `csgo/addons/sourcemod/translations/` klasörüne koy.
3. Sunucuyu yeniden başlat veya `sm plugins load gaggor` komutunu çalıştır.

---

## Komutlar

| Komut | Yetki | Açıklama |
|---|---|---|
| `sm_gaggor` | `ADMFLAG_GENERIC` (`b`) | GagGör bildirimlerini aç/kapat |

> Sunucuya bağlanan `ADMFLAG_GENERIC` yetkisine sahip adminler, bildirimler **varsayılan olarak açık** gelir.  
> `sm_gaggor` komutuyla istedikleri zaman kapatıp açabilirler.

---

## Nasıl Çalışır?

- Gag'li bir oyuncu `say` veya `say_team` komutuyla mesaj yazdığında eklenti devreye girer.
- Mesaj, o an sunucuda bulunan ve bildirimleri açık olan tüm adminlere iletilir.
- Normal oyuncular bu mesajları görmez; mesaj yalnızca adminlere görünür.