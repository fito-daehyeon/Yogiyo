# DHK iOSํ Coding Test
๐ ๋ค์ ์ ๊ณต๋๋ API๋ฅผ ๊ธฐ๋ฐ์ผ๋ก ๋ ์คํ ๋ ๋ชฉ๋ก๊ณผ ์ฐ๊ธฐ๋ฅ, ์ฐ๋ชฉ๋ก์ด ์๋ ํ๋ฉด์ ๋ง๋ญ๋๋ค.

โฑ ์ ํ์๊ฐ์ 24์๊ฐ ์๋๋ค. ์ค์ ๋ก ๊ตฌํํ๋๋ฐ ํ์ํ ์๊ฐ๋ณด๋ค ๋๋ํ๊ฒ ์ ๊ณต๋์์ต๋๋ค.


## ์๊ตฌ์ฌํญ
- ์๋์ ์ ๊ณต๋ API๋ฅผ ์ด์ฉํด ๋ ์คํ ๋ ๋ฐ์ดํฐ๋ฅผ ๊ฐ์ ธ์ต๋๋ค. (3ํ์ด์ง ๊น์ง ์ ๊ณต)
- ๋ ์คํ ๋ ํด๋ฆญ์ ์ฐ๋ชฉ๋ก์ ์ถ๊ฐ/์ญ์ ๊ฐ ๋๋๋ก ํฉ๋๋ค. ์ฐ๋ชฉ๋ก์ ๋ก์ปฌ์ ์ ์ฅํด ์ฃผ์ธ์. ์ฑ์ ๊ป๋ค์ผ๋ ์ ์ง๊ฐ ๋์ด์ผ ํฉ๋๋ค.
- ๋ฐ์ดํฐ์ ๋ชจ๋  ํค๊ฐ ํ์ฉ๋ฉ๋๋ค.
- ๋์์ธ์ ์คํฌ๋ฆฐ์ท์ ์ฐธ๊ณ ํ์๋ฉด ๋ฉ๋๋ค.
- ์์น๋ UI ๊ตฌ์ฑ์ ๊ด๋ จํด์๋ ์์ ๋กญ๊ฒ ๋ง๋ค์ด์ฃผ์ธ์.
- ๋ชฉ๋ก์ ์น์์ `sectionTitle`ํค์ value๋ก ๊ทธ๋ฃนํํ๋ฉด ๋ฉ๋๋ค.
- 3rd-party library๋ ์์ ๋กญ๊ฒ ์ฌ์ฉ ๊ฐ๋ฅํฉ๋๋ค.
- ํ์คํธ์ฝ๋ ์ถ๊ฐ์ ๊ฐ์ฐ์ ์ด ์์ต๋๋ค.


## json ๋ฐ์ดํฐ ํค ์ค๋ช
- `logoUrl` - ๋ ์คํ ๋ ์ธ๋ค์ผ ์ด๋ฏธ์ง url
- `name` - ํ๋ฉด์ ํ์๋๋ ๋ ์คํ ๋ ์ด๋ฆ
- `reviewAvg` - ๋ฆฌ๋ทฐ ํ๊ท  ์ ์
- `reviewCount` - ๋ฆฌ๋ทฐ ๊ฐฏ์, 0์ผ ๊ฒฝ์ฐ์๋ '์ฒซ๋ฒ์งธ ๋ฆฌ๋ทฐ๋ฅผ ๋จ๊ฒจ์ฃผ์ธ์!'๋ผ๋ ํ์คํธ๊ฐ ๋ธ์ถ
- `ownerReplyCount` - ์ฌ์ฅ๋์ด ๋จ ๋๊ธ ์, 0์ผ ๊ฒฝ์ฐ ํ์๋์ง ์์
- `sectionTitle` - ๊ทธ๋ฃนํ๋ ๋ฐ์ดํฐ์ ์น์์ ํ๋ฉด์ ํ์๋๋ ํ์คํธ
- `isPhoneOrderAvailable` - ์ ํ์ฃผ๋ฌธ ์์ด์ฝ ๋ธ์ถ ์ฌ๋ถ
- `payment` - ์๊ธฐ์๊ฒฐ์ , ํ์ฅ๊ฒฐ์  ๊ฐ๋ฅ ์ฌ๋ถ, `yogiseo`๊ฐ์ด ๋ค์ด์์ผ๋ฉด, ์๊ธฐ์๊ฒฐ์  ์์ด์ฝ์ด ๋ธ์ถ๋๊ณ , `offline`์ด๋ผ๋ ๊ฐ์ด ๋ค์ด์์ผ๋ฉด ํ์ฅ๊ฒฐ์  ์์ด์ฝ์ด ๋ธ์ถ
- `isAvailablePickup` - ํ์ดํฌ์์ ์์ด์ฝ ๋ธ์ถ ์ฌ๋ถ
- `deliveryMethod` - `OD/VD`. `OD`์ผ ๊ฒฝ์ฐ ์๊ธฐ์์ต์คํ๋ ์ค ์์ด์ฝ์ด ๋ธ์ถ


## API
- https://beomcheol.github.io/ios-codding-test-resources/restaurants/1/restaurant.json
- https://beomcheol.github.io/ios-codding-test-resources/restaurants/2/restaurant.json
- https://beomcheol.github.io/ios-codding-test-resources/restaurants/3/restaurant.json


## Screen Shot
<img src="https://raw.githubusercontent.com/beomcheol/ios-codding-test-resources/master/screen-shots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-09-15%20at%2010.32.32.png" width=320> <img src="https://raw.githubusercontent.com/beomcheol/ios-codding-test-resources/master/screen-shots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-09-15%20at%2010.32.37.png" width=320> <img src="https://raw.githubusercontent.com/beomcheol/ios-codding-test-resources/master/screen-shots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-09-15%20at%2010.43.52.png" width=320>
