## Example 1: height
```py {monaco-run} {height:'70px'}
print(Hello, World!)
```

## Example 2: maxHeight
```ts {2|3|7|12}{maxHeight:'100px'}
print(Hello, World!)
```

## Example 3: Line Highlighting
```ts {1}
print(Hello, World!)
print(dim)
```

## Example 4: Dynamic Line Highlighting
```ts {2-3|5|all}
function add(
  a: Ref<number> | number,
  b: Ref<number> | number
) {
  return computed(() => unref(a) + unref(b))
}
```

## Shiki Magic Move (https://sli.dev/features/shiki-magic-move)
In Slidev, we bind the magic-move to the clicks system. The syntax is to wrap multiple code blocks representing each step with ````md magic-move (mind it's 4 backticks), this will be transformed into one code block, that morphs to each step as you click.

````md magic-move
```js
console.log(`Step ${1}`)
```
```js
console.log(`Step ${1 + 1}`)
```
```ts
console.log(`Step ${3}` as string)
```
````

## code diff
```ts {monaco-diff}
console.log('Original text')
~~~
console.log('Modified text')
```
