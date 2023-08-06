<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
        'endpoint' => env('MAILGUN_ENDPOINT', 'api.mailgun.net'),
        'scheme' => 'https',
    ],

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],
    
    'google' => [
        'client_id' => '772708369649-tfis8gtpt6tl72npbkqa8vcmf8i9qtkg.apps.googleusercontent.com',
        'client_secret' => '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',
        'redirect' => 'http://localhost/authapi/public/index.php/googleSocial', // Replace with your callback URL
    ],
    'apple' => [
        'client_id' => '1011536579239-9jms3inickm32us6g1bj4jkf1vqro4k6.apps.googleusercontent.com',
        'client_secret' => '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',
        'redirect' => 'http://localhost/authapi/public/index.php/googleSocial', // Replace with your callback URL
    ],


    
];
