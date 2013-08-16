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

#import "TyphoonParameterInjectedByRawValue.h"

@implementation TyphoonParameterInjectedByRawValue

- (id)initWithParameterIndex:(NSUInteger)index value:(id)value
{
    self = [super init];
    if (self) {
        _index = index;
        _value = value;        
    }
    return self;
}

- (TyphoonParameterInjectionType)type
{
    return TyphoonParameterInjectedByRawValueType;
}

- (void)setInitializer:(TyphoonInitializer*)initializer
{
    //Do nothing.
}

@end
