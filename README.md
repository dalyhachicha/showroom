# Showroom (Live-Data Prototype)
E-commerce mobile app using Flutter (GetX)



## Screens
- Home: <br>
List products from firestore database<br>
- Product: <br>
Preview item pictures and details<br>
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

## IMPORTANT for testing/demo
If firebase auth refuse to sed more OTP SMS verifications, use:
mobile number: +216 24 077 446
OTP: 123456

## Next implimentations
- load images before rendering
- cache loaded images 

[FIX] order histroy view overflow

[FIX] adding same item to cart with different size overrides the old one (should add same item to card with different size)

[FIX] search feature in home drawer (not working for unknown reason)

[FIX] denying of position permission crashes the app (sometimes?)

[FIX] project structure (use get_cli)
