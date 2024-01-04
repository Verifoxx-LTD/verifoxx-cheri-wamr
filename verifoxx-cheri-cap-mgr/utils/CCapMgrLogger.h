// Simple logger for capability manager

#ifndef _CCAPMGRLOGGER_H__
#define _CCAPMGRLOGGER_H__

#include <iostream>
#include <sstream>
#include <string>
#include <array>
#include <stdio.h>
#include <sys/time.h>

namespace CapMgr
{
    inline std::string NowTime()
    {
        char buffer[11];
        time_t t;
        time(&t);
        tm r;
        strftime(buffer, sizeof(buffer), "%X", localtime_r(&t, &r));
        struct timeval tv;
        gettimeofday(&tv, 0);
        char result[100] = { 0 };
        std::sprintf(result, "%s.%03ld", buffer, (long)tv.tv_usec / 1000);
        return result;
    }

    enum TLogLevel
    {
        ALWAYS = 0,
        ERROR,
        WARNING,
        DEBUG,
        VERBOSE
    };

    constexpr std::array<const char*, VERBOSE - ALWAYS + 1> logLevelString = { "ALWAYS", "ERROR", "WARNING", "DEBUG", "VERBOSE" };

    template <typename T>
    class LogBase
    {
    public:
        LogBase() {}
        LogBase(const LogBase&) = delete;
        LogBase& operator=(const LogBase&) = delete;

        virtual ~LogBase()
        {
            
            os << std::endl;
            T::Output(os.str());
        }

        std::ostringstream& Get(TLogLevel level=DEBUG)
        {
            os << "[CAPMGR - " << NowTime();
            os << " " << ToString(level) << "]: ";
            os << std::string(level > VERBOSE ? level - VERBOSE : 0, '\t');
            return os;
        }

        static TLogLevel& Level()
        {
            static TLogLevel reportingLevel = VERBOSE;
            return reportingLevel;
        }

        static std::string ToString(TLogLevel level) { return logLevelString[level]; }

    protected:
        std::ostringstream os;
    };

    class Output2Stream
    {
    public:
        static void Output(const std::string& msg)
        {
            std::cout << msg;
        }
    };

    class Log : public LogBase<Output2Stream> {};

#define L_(level) \
    if (level > Log::Level()) ; \
    else Log().Get(level)


}
#endif /* _CCAPMGRLOGGER_H__ */
