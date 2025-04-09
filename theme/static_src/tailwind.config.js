/**
 * This is a minimal config.
 *
 * If you need the full config, get it from here:
 * https://unpkg.com/browse/tailwindcss@latest/stubs/defaultConfig.stub.js
 */

module.exports = {
    content: [
        /**
         * HTML. Paths to Django template files that will contain Tailwind CSS classes.
         */

        /*  Templates within theme app (<tailwind_app_name>/templates), e.g. base.html. */
        '../templates/**/*.html',

        /*
         * Main templates directory of the project (BASE_DIR/templates).
         * Adjust the following line to match your project structure.
         */
        '../../templates/**/*.html',

        /*
         * Templates in other django apps (BASE_DIR/<any_app_name>/templates).
         * Adjust the following line to match your project structure.
         */
        '../../**/templates/**/*.html',


    ],
    theme: {
//        Screens to set custom screen sizes
        screens: {
            sm: '480px',
            md: '768px',
            lg: '976px',
            xl: '1440px',
        },
        extend: {
            colors: {
             brightRed: 'hsl(12,88%,59%)',
             brightRedLight: 'hsl(12,88%,69%)',
             brightRedSuperLight: 'hsl(12,88%,95%)',
             darkBlue: 'hsl(228,39%,23%)',
             darkGrayishBlue: 'hsl(227,12%,61%)',
             veryDarkBlue: 'hsl(233,12%,13%)',
             veryPaleRed: 'hsl(13,100%,96%)',
             veryLightGray: 'hsl(0,0%,98%)',
            }
        },
    },
    plugins: [
        /**
         * '@tailwindcss/forms' is the forms plugin that provides a minimal styling
         * for forms. If you don't like it or have own styling for forms,
         * comment the line below to disable '@tailwindcss/forms'.
         */
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
        require('@tailwindcss/aspect-ratio'),
    ],
}
