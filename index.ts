import { $ } from "bun";

await $`echo 5`; // 5
const welcome = await $`echo "Hello World!"`.text();
console.log(welcome); // Hello World!\n

const result = await $`echo "Hello World!" | wc -w`.text();
console.log(result); // 2\n