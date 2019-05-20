Just some comments/assumptions as an overview:
- Since the high frequency of heart beats generated and the requirement to stream data as it is captured coupled with a 50% success rate, the buffer size is quite modest. It's unlikely to grow significantly because I tried to minimize the number of network calls by batching unrecorded beats together and sending as an array.
- HeartBeatObject is a wrapper object used throughout to represent individual data points. The object ID of heart beats is a counter, for simplicity sake. In a real-world implementation, time-stamps would also accompany the readings. 
- The server heartbeat storage is not mocked, so heartbeats are not currently retained in the app. This is for a simpler design.
- My initial thought-process was to use delegates completely to route communication between the objects, by making the UIViewController the master of the three big components. I pivoted away from this somewhat as I didn't want two objects being delegates of one another.
- One thing I would change if I had to improve the quality of this code would be to replace NSMutableArrays to NSArrays for better reliability. I implemented it with mutable arrays as I initially figured the same array would be repeatedly modified, but since the array is being passed from module to module, it's better to pass NSArray's.

Please see the design diagram for an overall modular view of the app (HeartBeatSync Design (1).png).
