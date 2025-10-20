# Cashfree Payment Gateway Integration

## Overview

This project now includes a complete Cashfree payment gateway integration for event registration payments. The integration supports both sandbox (testing) and production modes.

## Features

✅ **Complete Cashfree Integration**
- Payment session creation
- Payment status verification
- Webhook handling for payment callbacks
- Support for multiple payment methods (UPI, Cards, Net Banking, Wallets)
- CDN-based SDK loading for better compatibility

✅ **Frontend Components**
- Updated PaymentModal with Cashfree SDK (CDN-based)
- Cashfree payment service
- Test component for integration verification
- TypeScript declarations for Cashfree SDK

✅ **Backend API**
- Firebase Functions for payment processing
- CORS-enabled endpoints
- Proper error handling and logging

## Quick Start

### 1. Get Cashfree Credentials

1. Sign up at [cashfree.com](https://www.cashfree.com)
2. Go to **Developers** section in your dashboard
3. Copy your **App ID** and **Secret Key**

### 2. Setup Backend

```bash
cd backend/functions
chmod +x setup-cashfree.sh
./setup-cashfree.sh
```

Or manually:

```bash
cd backend/functions
npm install
npm run build
firebase functions:config:set cashfree.secret_key="your_secret_key"
firebase functions:config:set cashfree.app_id="your_app_id"
firebase functions:config:set cashfree.mode="sandbox"
firebase deploy --only functions
```

### 3. Update Frontend Configuration

In `frontend/services/cashfreeService.ts`, update the `baseUrl`:

```typescript
private baseUrl = 'https://your-region-your-project-id.cloudfunctions.net';
```

### 4. Test the Integration

1. Start your frontend development server
2. Navigate to `/cashfree-test` to test the API endpoints
3. Navigate to `/payment-demo` to test the full payment flow

## File Structure

```
frontend/
├── services/
│   ├── cashfreeService.ts          # Cashfree API service
│   └── paymentService.ts           # Updated to use Cashfree
├── components/
│   ├── PaymentModal.tsx            # Updated payment modal
│   └── CashfreeTest.tsx            # Test component
└── ...

backend/functions/
├── src/
│   └── index.ts                    # Firebase Functions with Cashfree endpoints
├── package.json                    # Updated with Cashfree dependencies
└── setup-cashfree.sh              # Setup script
```

## API Endpoints

### Firebase Functions

- `createCashfreeSession` - Creates a payment session
- `getCashfreePaymentStatus` - Checks payment status by order ID
- `handleCashfreeCallback` - Handles payment webhooks

### Frontend Service Methods

- `createPaymentSession()` - Create payment session
- `verifyPaymentStatus()` - Check payment status
- `handlePaymentCallback()` - Handle payment callbacks

## Configuration

### Environment Variables

#### Frontend (.env)
```env
VITE_CASHFREE_MODE=sandbox
VITE_CASHFREE_APP_ID=your_app_id
```

#### Backend (Firebase Functions)
```bash
firebase functions:config:set cashfree.secret_key="your_secret_key"
firebase functions:config:set cashfree.app_id="your_app_id"
firebase functions:config:set cashfree.mode="sandbox"
```

## Testing

### Sandbox Mode
- Use test credentials provided by Cashfree
- No real money is charged
- All transactions are simulated

### Test Cards (Sandbox)
- **Success**: 4111111111111111
- **Failure**: 4000000000000002
- **CVV**: Any 3 digits
- **Expiry**: Any future date

## Troubleshooting

### Common Issues

1. **CORS Errors**
   - Ensure Firebase Functions have proper CORS configuration
   - Check if your domain is whitelisted in Cashfree dashboard

2. **API Key Errors**
   - Verify your Cashfree credentials are correct
   - Check if the environment variables are set properly

3. **Payment Session Creation Fails**
   - Check Firebase Functions logs
   - Verify the API base URL is correct
   - Ensure your domain is whitelisted

4. **SDK Loading Issues**
   - Check if the Cashfree SDK is properly installed
   - Verify the import statements are correct

### Debug Steps

1. Check browser console for errors
2. Check Firebase Functions logs: `firebase functions:log`
3. Test API endpoints directly using the test component
4. Verify Cashfree dashboard for transaction logs

## Production Deployment

### 1. Switch to Production Mode

```bash
firebase functions:config:set cashfree.mode="production"
```

Update frontend environment:
```env
VITE_CASHFREE_MODE=production
```

### 2. Update Credentials

Use your production Cashfree credentials:
```bash
firebase functions:config:set cashfree.secret_key="prod_secret_key"
firebase functions:config:set cashfree.app_id="prod_app_id"
```

### 3. Domain Whitelisting

Add your production domain to Cashfree dashboard:
1. Go to **Developers** > **Whitelisting**
2. Add your production domain
3. Add your Firebase Functions domain

### 4. Deploy

```bash
firebase deploy --only functions
```

## Security Considerations

1. **Never expose secret keys** in frontend code
2. **Always verify webhooks** using signature verification
3. **Use HTTPS** in production
4. **Implement proper error handling** and logging
5. **Validate all payment data** before processing

## Support

- [Cashfree Documentation](https://docs.cashfree.com)
- [Cashfree Support](https://www.cashfree.com/en/support)
- [Firebase Functions Documentation](https://firebase.google.com/docs/functions)

## Changelog

### v1.0.0
- Initial Cashfree integration
- Payment session creation
- Payment status verification
- Webhook handling
- Test components and documentation
