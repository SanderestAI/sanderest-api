<?php
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
use Illuminate\Http\Request;
use App\Modules\User\Transformers\User as UserTransformer;
use Illuminate\Support\Facades\Route;

Route::prefix('/{account}')->group(function () {
    Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
        return new UserTransformer(auth()->user());
    });

    // Used to user authentication api

    Route::namespace('\\App\\Modules\\User\\Infrastructure\\Controller\\')->group(function () {
        Route::post('/login', 'Api@login');
        Route::post('/verify2fa', 'Api@verify2fa');
        Route::post('/deleteAccount', 'Api@deleteAccount');
        // TODO Route::post('/refreshToken', 'Api@refreshToken');
        Route::middleware('auth:sanctum')->post('/logout', 'Api@logout');
        Route::post('/forgotReset', 'Api@forgotReset');
        Route::post('/forgotSendResetLinkEmail', 'Api@forgotSendResetLinkEmail');
        Route::post('/register', 'Api@register');
        Route::post('/verify', 'Api@verify');
    });

    // Public theme routes
    Route::namespace('\\App\\Modules\\Theme\\Infrastructure\\Controller')->group(function () {
        Route::get('theme/active', 'Api@getActiveTheme');
    });

    // Usual routes authed
    Route::namespace('\\App\\Modules\\')->middleware('auth:sanctum')->group(function () {
        Route::prefix('/manager')->group(function () {
            Route::middleware('manager')->group(function () {
                Route::apiResource('event-metas', 'Event\\Infrastructure\\Controller\\ApiMeta')->only(['index', 'store', 'show', 'update', 'destroy']);
                Route::get('/event-metas-by-ids', 'Event\\Infrastructure\\Controller\\ApiMeta@getByIds');
                Route::delete('/event-metas', 'Event\\Infrastructure\\Controller\\ApiMeta@destroy');
                Route::get('/event-metas-download', 'Event\\Infrastructure\\Controller\\ApiMeta@download');
                Route::get('/event-metas-fields', 'Event\\Infrastructure\\Controller\\ApiMeta@fields');
                Route::post('/event-metas-upload', 'Event\\Infrastructure\\Controller\\ApiMeta@upload');
                Route::get('/event-metas-upload', 'Event\Infrastructure\Controller\ApiMeta@uploadStatus');
                Route::delete('/event-metas-upload/{id}', 'Event\Infrastructure\Controller\ApiMeta@deleteUpload');

                Route::apiResource('user', 'User\Infrastructure\Controller\ApiManager')->only(['index', 'show', 'update']);
                Route::get('/user-by-ids', 'User\Infrastructure\Controller\ApiManager@getByIds');
                Route::get('/user-download', 'User\Infrastructure\Controller\ApiManager@download');
                Route::post('/user-password-reset', 'User\Infrastructure\Controller\Api@resetPasswordLogged');
                Route::get('/user-generate2fa', 'User\Infrastructure\Controller\Api@generate2fa');
                Route::post('/user-confirm2fa', 'User\\Infrastructure\\Controller\\Api@confirm2fa');

                Route::apiResource('theme', 'Theme\\Infrastructure\\Controller\\Api')->only(['index', 'store', 'show', 'update', 'destroy']);
                Route::get('/theme-by-ids', 'Theme\\Infrastructure\\Controller\\Api@getByIds');
                Route::delete('/theme', 'Theme\\Infrastructure\\Controller\\Api@destroy');
                Route::get('/theme-download', 'Theme\\Infrastructure\\Controller\\Api@download');
                Route::get('/theme-fields', 'Theme\\Infrastructure\\Controller\\Api@fields');
                Route::post('/theme-upload', 'Theme\\Infrastructure\\Controller\\Api@upload');
                Route::get('/theme-upload', 'Theme\\Infrastructure\\Controller\\Api@uploadStatus');
                Route::delete('/theme-upload/{id}', 'Theme\\Infrastructure\\Controller\\Api@deleteUpload');
                Route::post('/theme/{id}/activate', 'Theme\\Infrastructure\\Controller\\Api@activate');

                Route::apiResource('theme-config', 'Theme\\Infrastructure\\Controller\\ApiConfig')->only(['index', 'store', 'show', 'update', 'destroy']);
                Route::get('/theme-config-by-ids', 'Theme\\Infrastructure\\Controller\\ApiConfig@getByIds');
                Route::delete('/theme-config', 'Theme\\Infrastructure\\Controller\\ApiConfig@destroy');
                Route::get('/theme-config-download', 'Theme\\Infrastructure\\Controller\\ApiConfig@download');
                Route::get('/theme-config-fields', 'Theme\\Infrastructure\\Controller\\ApiConfig@fields');
                Route::post('/theme-config-upload', 'Theme\\Infrastructure\\Controller\\ApiConfig@upload');
                Route::get('/theme-config-upload', 'Theme\\Infrastructure\\Controller\\ApiConfig@uploadStatus');
                Route::delete('/theme-config-upload/{id}', 'Theme\\Infrastructure\\Controller\\ApiConfig@deleteUpload');
                Route::post('/theme-config/{id}/activate', 'Theme\\Infrastructure\\Controller\\ApiConfig@activate');
            });
            Route::middleware('employee')->group(function () {
                // TODO endpoints to ambassadors
            });
        });

        Route::namespace('EmployeeManager\\Infrastructure\\Controller')->group(function () {
            Route::get('/user-is-manager', 'EmployeeController@userIsManager')->name('user-is-manager');
            Route::get('/user-is-employee', 'EmployeeController@userIsEmployee')->name('user-is-employee');
        });

        Route::namespace('User\\Infrastructure\\Controller')->group(function () {
            Route::post('setIP', 'Api@setIP');
            Route::post('getIP', 'Api@getIP');
        });
        /* Route::namespace('Game\Profile\Infrastructure\Controller')->group(function () {
            Route::post('profile/getUserProfile', 'Api@getUserProfile');
            Route::post('profile/setAvatar', 'Api@setAvatar');
            Route::post('profile/setEstado', 'Api@setEstado');
            Route::post('profile/setUserProfileReferredCode', 'Api@setUserProfileReferredCode');
            Route::post('profile/setUserProfileReferredCodeFrom', 'Api@setUserProfileReferredCodeFrom');
        }); */
        Route::namespace('Event\\Infrastructure\\Controller')->group(function () {
            Route::get('event/list', 'Api@index');
            Route::post('event/readEvent', 'Api@readEvent');
        });
    });

    // Public game routes
    Route::namespace('\\App\\Modules\\Blockchain\\')->group(function () {
        // Route::get('sorteo', 'Wallet\\Infrastructure\\Controller\\Api@sorteo');
    });
});
