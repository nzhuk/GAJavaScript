/*
 Copyright (c) 2011 Andrew Goodale. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification, are
 permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this list of
 conditions and the following disclaimer.
 
 2. Redistributions in binary form must reproduce the above copyright notice, this list
 of conditions and the following disclaimer in the documentation and/or other materials
 provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY ANDREW GOODALE "AS IS" AND ANY EXPRESS OR IMPLIED
 WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 The views and conclusions contained in the software and documentation are those of the
 authors and should not be interpreted as representing official policies, either expressed
 or implied, of Andrew Goodale.
 */

#import "GAScriptMethodSignatures.h"

static NSMutableSet* s_classes = nil;
static dispatch_once_t s_onceToken;
static void(^s_initBlock)(void) = ^(void)
{
    s_classes = [[NSMutableSet alloc] initWithCapacity:16];
    [s_classes addObject:[GAScriptMethodSignatures class]];    
};

@implementation GAScriptMethodSignatures

+ (void)addMethodSignaturesForClass:(Class)clazz
{
    dispatch_once(&s_onceToken, s_initBlock);
	
	[s_classes addObject:clazz];
}

+ (NSMethodSignature *)findMethodSignatureForSelector:(SEL)aSelector
{
    dispatch_once(&s_onceToken, s_initBlock);
    
    // If performance becomes a concern, we can build a cache of these mappings.
    //
    for (Class aClass in s_classes)
    {
        if ([aClass instancesRespondToSelector:aSelector])
            return [aClass instanceMethodSignatureForSelector:aSelector];
    }
	
    return nil;
}

#pragma mark Common methods

- (NSUInteger)length
{
    return 0;
}

- (id)item:(NSInteger)index
{
    return nil;
}

#pragma mark DOM Methods

- (id)getElementById:(NSString *)elementId
{
	return nil;
}

- (id)getElementsByTagName:(NSString *)tagName
{
	return nil;
}

- (id)getElementsByClassName:(NSString *)className
{
    return nil;
}

- (id)querySelector:(NSString *)selector
{
    return nil;
}

- (id)querySelectorAll:(NSString *)selector
{
    return nil;
}

#pragma mark View methods

- (id)getComputedStyle:(id)element
{
    return nil;
}


@end
