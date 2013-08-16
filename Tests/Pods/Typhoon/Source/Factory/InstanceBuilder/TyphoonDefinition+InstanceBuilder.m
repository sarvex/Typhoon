////////////////////////////////////////////////////////////////////////////////
//
//  TYPHOON FRAMEWORK
//  Copyright 2013, Jasper Blues & Contributors
//  All Rights Reserved.
//
//  NOTICE: The authors permit you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

#import "TyphoonDefinition+InstanceBuilder.h"
#import "TyphoonPropertyInjectedByValue.h"
#import "TyphoonPropertyInjectedByType.h"
#import "TyphoonPropertyInjectedByReference.h"


@implementation TyphoonDefinition (InstanceBuilder)



/* ========================================================== Interface Methods ========================================================= */
- (NSString*)factoryReference
{
    return _factoryReference;
}

- (void)setFactoryReference:(NSString*)factoryReference;
{
    _factoryReference = factoryReference;
}

- (void)injectProperty:(SEL)selector withReference:(NSString*)reference
{
    [_injectedProperties addObject:[[TyphoonPropertyInjectedByReference alloc]
            initWithName:NSStringFromSelector(selector) reference:reference]];
}

- (NSSet*)propertiesInjectedByValue
{
    return [self injectedPropertiesWithKind:[TyphoonPropertyInjectedByValue class]];
}

- (NSSet*)propertiesInjectedByType
{
    return [self injectedPropertiesWithKind:[TyphoonPropertyInjectedByType class]];
}

- (NSSet*)propertiesInjectedByReference
{
    return [self injectedPropertiesWithKind:[TyphoonPropertyInjectedByReference class]];
}

- (void)addInjectedProperty:(id <TyphoonInjectedProperty>)property
{
    [_injectedProperties addObject:property];
}

/* ============================================================ Private Methods ========================================================= */
- (NSSet*)injectedPropertiesWithKind:(Class)clazz
{
    NSPredicate* predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary* bindings)
    {
        return [evaluatedObject isKindOfClass:clazz];
    }];
    return [_injectedProperties filteredSetUsingPredicate:predicate];
}

@end