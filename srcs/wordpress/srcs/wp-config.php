<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'heusebio' );

/** MySQL database username */
define( 'DB_USER', 'heusebio' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-svc:3306' );
define( 'WP_HOME', 'http://192.168.49.2:5050/' );
define( 'WP_SITEURL', 'http://192.168.49.2:5050/' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/** Filesystem operation method. */
define( 'FS_METHOD', 'direct');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'sn9a .EPy~?aV*$ VE7+Rd[]vc+~5dyYg;>ze*)%zm5NYNq2$]qjkT)rIee4L5g9');
define('SECURE_AUTH_KEY',  ']v;S:+dR@=+(eSt7mz_aupV[+6UGRn>fjGER^A5T9~O_y6peGCIc-u`HWNC#+KsV');
define('LOGGED_IN_KEY',    '^9?I8G9:JG}GT2hm2a?~+N4met^ytm&Gv`lEB5Pm@xXq3djVK7BLf+U=tW||Uf2?');
define('NONCE_KEY',        'cMQXP m6zv@XL]{u}OkB(PWGh=A_Em8]+&mah+nl(>-|I7o,P/c#uYcn)2gUf0c1');
define('AUTH_SALT',        'u[*s1+b|KGlUDQf,A72O_c}8X3vY+mMj}ou_yp%RR+M}|mZ*li4&[JMHUn1@+SF-');
define('SECURE_AUTH_SALT', '>C*PH0E.X.l}P2=xJr/G#e5]dB}$qvKWqgaR.3HLu1J9-|E|Eg|=yjJ&mC~n!TCd');
define('LOGGED_IN_SALT',   '?yUw-^x<xC#/jT/VdK3!O^-i^&fn^d%kSw%A;o{pBg]-`O.[w|I)`tH#S{`p,G~B');
define('NONCE_SALT',       'YrCSc_QBDp3g-eTV_jT&c/0%tr<:!7F4aKiC7^^+y}-L3FOt_L)9Br!u;SGo=3;c');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
