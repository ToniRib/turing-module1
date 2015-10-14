## Dangers of Bang Methods

### Question

- Summarize in your own words the conventions around methods whose names end in a !
- Describe in your own words the advantages and disadvantages of these methods. When would you want to use one and when would you want to avoid using one.

### Answer

Methods that end with a bang (!) are generally DESTRUCTIVE methods, meaning that they actually change the object that called them. However, just because a method doesn't have a bang doesn't necessarily mean it's non-destructive. Methods like push and pop are both destructive (another way of saying they mutate the caller) even though they don't have a bang at the end.

The true definition is that they are the less-used version of a method. So, while map creates a new array and is commonly used, map! is less common since it is destructive and thus gets the bang operator.

If you want to modify your current object without creating a new one, using a destructive method will allow you to do that. However, you won't necessarily be able to get the original object back, so sometimes it is better to use a non-destructive method that allows you to create a new (and modified) copy while still retaining the original copy.
