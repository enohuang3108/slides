## Click Markers

For some slides you may have longer notes that could be hard to find your place. Slidev supports click markers that allow highlighting and auto-scrolling to the section of notes from your corresponding content. Put [click] markers at the beginning of any line in your notes for the timing you need to go to another click. You may skip n clicks by using [click:{n+1}]. For example:

```
<!--
Content before the first click

[click] This will be highlighted after the first click

Also highlighted after the first click

- [click] This list element will be highlighted after the second click

[click:3] Last click (skip two clicks)
-->
```
