YMXML
======

YMXML is an AS3/MXML Framework allowing quick development with GPU accelerated Rendering (Stage3D). Flex developers will feel home in minutes. YMXML gives you way faster loading times and runtime rendering then Flex thanks to GPU acceleration and a true light weight framework. 

It is based on Starling and Feathers.


Why MXML (with GPU/Starling)?
-----------

In my opinion MXML is the best markup language. Writing a GUI in MXML is about 50% the LOC and 300% the readability/maintainability as pure AS3. Databinding saves large amounts of time. The integration with AS3 is a breeze. MXML files just compile down to standard AS3 Classes.

As of now MXML was more or less coupled to Flex. Flex has a huge amount of features. But it produces relativly large and slow applications. Flex does not support GPU rendering. For Mobile Apps Flex is just rarely a good choice.

YMXML creates a layer that supports all the goodness of MXML with a lighweigth, fast framework based on Starling and Feathers for GPU Rendering, small file sizes and fast loading. Crossplattform development with AIR now got really easy.


YMXML Features
-----------

- easy to learn. Flex developers can start developing immediatly. You dont even know you are rendering on the GPU until it runs smooth on a mobile device.
- small, a "Hello World" application rendered on the GPU is 80kb and pure MXML.
- fast and simple MXML skinning. No 1000 lines long AS3 Skinning Files. 
- every embbeded PNG/JPG gets packaged into a single TextureAtlas at runtime. This way it is easy to edit and integrate asset, but by using a single TextureAtlas maxium performance is available.
- build in Transitions, just set the (optional) "transitionDuration" property on any Element and moving, fading, scaling animations are just setting the property to the final value. More sophisticated Animations are can be define with Effect Objects.
- translates starling.Events to flash.Events. YMXML resolves conflicts due to Starling Eventdispatcher and Flash Eventdispatcher automagically.
- simple things that can help a lot. E.g. Label components have a simple "outline" color property to create an outline without any more work.
- every YMXML GUI Component is prefixed with "Y". Makes finding YMXML components easy.
- a lot more yet to come.

YMXML Demo
-----------

Coming Soon


YMXML important Notes
-----------

1. Compile with "-static-link-runtime-shared-libraries=true"
2. As the first namespace in every .mxml file always use 'xmlns:fx="http://ns.adobe.com/mxml/2009"' NOT the MX namespace or adding children will fail silently. If someone knows why please let me know :)

YMXML is still Alpha, there is no documentation yet
==============