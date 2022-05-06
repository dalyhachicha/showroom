# Showroom (Live-Data Prototype)
E-commerce mobile app using Flutter (GetX)

## IMPORTANT for testing/demo
- If firebase auth refuse to sed more OTP SMS verifications, use: <br>
mobile number: +216 24 077 446 | OTP: 123456
- APK path location: build\app\outputs\flutter-apk\

## Screens
- Home: <br>
list products from firestore database<br>
- Product: <br>
preview item pictures and details<br>
add item to cart<br>
- Cart: <br>
preview cart items<br>
add/substract item quantity<br>
remove item<br>
cart total<br>
- History:<br>
list orders submitted with this account with details (id, order date, total and status)<br>

## Features
- Dynamic themes (Light/Dark Modes)<br>
- Custom slider in item page<br>
- OTP authentication (firebase)<br>
- Get current position (for signing up, address field)<br>
- Save user preferences in local storage (theme, account info, 

## Next implimentations
- load images before rendering
- cache loaded images 

## FIX
- Order histroy view overflow <br>
- Adding same item to cart with different size overrides the old one (should add same item to card with different size)<br>
- Search feature in home drawer (not working for unknown reason)<br>
- Denying of position permission crashes the app (sometimes?)<br>
- Project structure (use get_cli)<br>
- Update firestore packages and usage. (Some input files use or override a deprecated API.)
