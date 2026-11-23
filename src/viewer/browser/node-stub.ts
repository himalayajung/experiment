// Stands in for node:fs, node:path and node:url in the browser bundle. Nothing the replay runs reads files.
const no = () => { throw new Error('not available in the browser'); };
export const readFileSync = no, existsSync = () => false, readdirSync = no, statSync = no, writeFileSync = no, mkdirSync = no, appendFileSync = no;
export const join = (...p: string[]) => p.join('/'), isAbsolute = (p: string) => p.startsWith('/'), dirname = (p: string) => p.replace(/\/[^/]*$/, ''), basename = (p: string) => p.replace(/^.*\//, ''), resolve = join, relative = (_: string, b: string) => b, extname = (p: string) => /\.[^./]*$/.exec(p)?.[0] ?? '', normalize = (p: string) => p, sep = '/';
export const fileURLToPath = () => '/';
export default { readFileSync, existsSync, join, isAbsolute, dirname, basename, resolve, relative, extname, normalize, sep, fileURLToPath };
