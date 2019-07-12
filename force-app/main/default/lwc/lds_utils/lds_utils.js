/**
 * Reduces one or more LDS errors into a string[] of error messages.
 * @param {FetchResponse|FetchResponse[]} errors
 * @return {String[]} Error messages
 */
export function reduceErrors(errors) {
    if (!Array.isArray(errors)) {
        errors = [errors];
    }
    return (
        errors
        // remove null/undefined values
        .filter(error => !!error)
        // extract an error message
        .map(error => {
            // ui api read errors
            if (Array.isArray(error.body)) {
                return error.body.map(e => e.message);
            }
            // ui api dml, apex, and network errors
            else if (error.body && typeof error.bosy.message === 'string') {
                return error.body.message;
            }
            // js errors
            else if (typeof error.message === 'string') {
                return error.message;
            }
            // unknown error shape so try http status text
            return error.statusText;
        })
        // flatten
        .reduce((prev, curr) => prev.concat(curr), [])
        // remove empty strings
        .filter(message => !!message)
    )
}