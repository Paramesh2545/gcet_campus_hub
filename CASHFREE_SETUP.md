# Cashfree Payment Gateway Setup Guide

## Prerequisites

1. **Cashfree Account**: Sign up at [cashfree.com](https://www.cashfree.com)
2. **Firebase Project**: Ensure your Firebase project is set up
3. **Domain Whitelisting**: Add your domain to Cashfree dashboard

## Configuration Steps

### 1. Get Cashfree Credentials

1. Login to your Cashfree dashboard
2. Go to **Developers** section
3. Copy your **App ID** and **Secret Key**

### 2. Update Environment Variables

#### Frontend (.env file in frontend directory)
```env
VITE_CASHFREE_MODE=sandbox
VITE_CASHFREE_APP_ID=your_cashfree_app_id
```

#### Backend (Firebase Functions)
Set these in Firebase Functions environment:
```bash
firebase functions:config:set cashfree.secret_key="your_secret_key"
firebase functions:config:set cashfree.app_id="your_app_id"
firebase functions:config:set cashfree.mode="sandbox"
```

### 3. Update API Base URL

In `frontend/services/cashfreeService.ts`, update the `baseUrl`:
```typescript
private baseUrl = 'https://your-region-your-project-id.cloudfunctions.net';
```

### 4. Deploy Firebase Functions

```bash
cd backend/functions
npm install
npm run build
firebase deploy --only functions
```

### 5. Test the Integration

1. Start your frontend development server
2. Navigate to `/cashfree-test` to test API endpoints
3. Navigate to `/payment-demo` to test the full payment flow
4. The Cashfree payment modal should appear with CDN-loaded SDK

## API Endpoints

The following Firebase Functions are created:

- `createCashfreeSession` - Creates a payment session
- `getCashfreePaymentStatus` - Checks payment status
- `handleCashfreeCallback` - Handles payment callbacks

## Testing

### Sandbox Mode
- Use test card numbers provided by Cashfree
- No real money is charged
- All transactions are simulated

### Production Mode
- Change `VITE_CASHFREE_MODE` to `production`
- Update backend environment to `production`
- Use real Cashfree credentials

## Troubleshooting

1. **CORS Issues**: Ensure Firebase Functions have proper CORS configuration
2. **API Key Issues**: Verify your Cashfree credentials are correct
3. **Domain Issues**: Make sure your domain is whitelisted in Cashfree dashboard
4. **Network Issues**: Check if your Firebase Functions are deployed and accessible

## Support

For Cashfree-specific issues, refer to:
- [Cashfree Documentation](https://docs.cashfree.com)
- [Cashfree Support](https://www.cashfree.com/en/support)
