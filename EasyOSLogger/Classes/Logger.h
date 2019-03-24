//
//  Logger.h
//  Gsabatie
//
//  Created by Sabatie Guillaume on 3/5/19.
//  Copyright © 2019 Sabatie Guillaume, Inc. All rights reserved.
//

#ifndef Logger_h
#define Logger_h

#define LogV(message, ...) [Log verbose:^{\
                                            return ([NSString stringWithFormat:message,\
                                                              ##__VA_ARGS__]);\
                                         }\
                                category: LogCategoryApp\
                                functionName:[NSString stringWithUTF8String:__func__]\
                                lineNumber:__LINE__\
                                fileName:[NSString stringWithUTF8String:__FILE__]]

#define LogI(message, ...) [Log info:^{\
                                            return ([NSString stringWithFormat:message,\
                                                                ##__VA_ARGS__]);\
                                        }\
                                category: LogCategoryApp\
                                functionName:[NSString stringWithUTF8String:__func__]\
                                lineNumber:__LINE__\
                                fileName:[NSString stringWithUTF8String:__FILE__]]

#define LogW(message, ...) [Log warning:^{\
                                            return ([NSString stringWithFormat:message,\
                                                                ##__VA_ARGS__]);\
                                        }\
                                category: LogCategoryApp\
                                functionName:[NSString stringWithUTF8String:__func__]\
                                lineNumber:__LINE__\
                                fileName:[NSString stringWithUTF8String:__FILE__]]

#define LogD(message, ...) [Log debug:^{\
                                            return ([NSString stringWithFormat:message,\
                                                                ##__VA_ARGS__]);\
                                        }\
                                category: LogCategoryApp\
                                functionName:[NSString stringWithUTF8String:__func__]\
                                lineNumber:__LINE__\
                                fileName:[NSString stringWithUTF8String:__FILE__]]

#define LogE(message, ...) [Log error:^{\
                                            return ([NSString stringWithFormat:message,\
                                                                ##__VA_ARGS__]);\
                                }\
                                category: LogCategoryApp\
                                functionName:[NSString stringWithUTF8String:__func__]\
                                lineNumber:__LINE__\
                                fileName:[NSString stringWithUTF8String:__FILE__]]

#define LogF(message, ...) [Log entryFunction:^{\
                                                return ([NSString stringWithFormat:message,\
                                                                    ##__VA_ARGS__]);\
                                                }\
                                category: LogCategoryApp\
                                functionName:[NSString stringWithUTF8String:__func__]\
                                lineNumber:__LINE__\
                                fileName:[NSString stringWithUTF8String:__FILE__]]

#define LogEF(message, ...) [Log exitFunction:^{\
                                                return ([NSString stringWithFormat:message,\
                                                                ##__VA_ARGS__]);\
                                }\
                                category: LogCategoryApp\
                                functionName:[NSString stringWithUTF8String:__func__]\
                                lineNumber:__LINE__\
                                fileName:[NSString stringWithUTF8String:__FILE__]]

#endif /* Logger_h */
