// CCapMgrException: Common exception class

#ifndef __CCAPMGREXCEPTION_H_
#define __CCAPMGREXCEPTION_H_

#include <exception>
#include <string>

class CCapMgrException : public std::runtime_error
{
public:
    CCapMgrException(const std::string& msg = "")
        : std::runtime_error(msg)
    {
    }
};


#endif /* __CCAPMGREXCEPTION_H_ */