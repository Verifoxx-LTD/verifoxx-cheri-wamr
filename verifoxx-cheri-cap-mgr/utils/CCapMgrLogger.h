// Simple logger for capability manager

#ifndef _CCAPMGRLOGGER_H__
#define _CCAPMGRLOGGER_H__

#include <iostream>
#include <sstream>
#include <string>
#include <array>
#include <cstdio>
#include <chrono>

using namespace std::chrono;

namespace CapMgr
{
    inline std::string NowTime()
    {
        char buf[32] = { 0 };

        auto now_time = steady_clock::now();
        auto duration = now_time.time_since_epoch();
        auto h = duration_cast<hours>(duration);
        duration -= h;
        auto m = duration_cast<minutes>(duration);
        duration -= m;
        auto s = duration_cast<seconds>(duration);
        duration -= s;
        auto ms = duration_cast<milliseconds>(duration);

        snprintf(buf, sizeof(buf), "%02u:%02u:%02u:%03u", h.count(), m.count(), s.count(), ms.count());

        return buf;
    }

    enum TLogLevel
    {
        ALWAYS = 0,
        ERROR,
        WARNING,
        DEBUG,
        VERBOSE
    };

    constexpr std::array<const char*, VERBOSE - ALWAYS + 1> logLevelString =
    { "INFO ", "ERROR", "WARN ", "DEBUG", "VRBSE" };

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
            os << "[" << NowTime() << " - CAPMGR:" << ToString(level) << "]: ";
            os << std::string(level > VERBOSE ? level - VERBOSE : 0, '\t');
            return os;
        }

        static TLogLevel& Level()
        {
            static TLogLevel reportingLevel = ALWAYS;
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
