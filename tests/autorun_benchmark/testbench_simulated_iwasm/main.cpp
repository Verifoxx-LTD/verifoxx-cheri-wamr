/*
 * Copyright (C) 2024 Verifoxx Limited
 * Dummy iwasm program to validate the automated benchmark test environment
 */

// C includes
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstddef>
#include <cstdint>

// C++ includes
#include <iostream>
#include <fstream>
#include <string>
#include <memory>
#include <vector>
#include <sstream>
#include <algorithm>
#include <chrono>
#include <thread>

class TestType
{
    static constexpr int m_RAND_LO = 10;
    static constexpr int m_RAND_HI = 300;

protected:
    float m_result;

public:
    TestType()
    {
        // Generate some random result
        m_result = static_cast<float>(rand() % (m_RAND_HI - m_RAND_LO) + m_RAND_LO);
    }

    virtual int get_exit_code()
    {
        return 0;
    }

    virtual std::string get_stdout() = 0;

    virtual ~TestType() {}
};


class CoremarkTestType : public TestType
{
public:
    virtual std::string get_stdout()
    {
        std::stringstream strstr;

        strstr << "Total time (secs): " << m_result << std::endl;

        return strstr.str();
    }
};


class DhrystoneTestType : public TestType
{
public:
    virtual std::string get_stdout()
    {
        std::stringstream strstr;

        strstr << "Microseconds for one run through Dhrystone: " << m_result << std::endl;

        return strstr.str();
    }

    virtual int get_exit_code()
    {
        return 1;
    }
};

class PolybenchTestType : public TestType
{
public:
    virtual std::string get_stdout()
    {
        std::stringstream strstr;

        strstr << m_result << std::endl;

        return strstr.str();
    }

};

class SightglassTestType : public TestType
{
public:
    // Sightglass doesn't output anything - we time it externally
    // To give some variation, implement a delay for a random number of mS
    // We will use m_Result as mS which will a maximum delay of 300mS
    virtual std::string get_stdout()
    {
        // Delay
        std::this_thread::sleep_for(std::chrono::milliseconds(static_cast<int>(m_result)));
        return std::string();
    }
};


std::string upper_string(const std::string& str)
{
    std::string upper;
    std::transform(str.begin(), str.end(), std::back_inserter(upper), toupper);
    return upper;
}

// Analyse the name of the given file (either native prog or WASM / AOT) 
// to work out which test we are doing
std::unique_ptr<TestType> make_test_type(const std::string &name_to_check)
{
	std::string upper{upper_string(name_to_check)};
	
	if (upper.find("COREMARK") != std::string::npos)
	{
		return std::make_unique<CoremarkTestType>();
	}
	else if (upper.find("DHRYSTONE") != std::string::npos)
	{
		return std::make_unique<DhrystoneTestType>();
	}
	else if (upper.find("POLYBENCH") != std::string::npos)
	{
		return std::make_unique<PolybenchTestType>();
	}
    else if (upper.find("SIGHTGLASS") != std::string::npos)
    {
        return std::make_unique<SightglassTestType>();
    }

    return nullptr;
}


int main(int argc, char* argv[])
{
    bool file_found = true; // File found if isn't one supplied on argument
    std::string this_prog(argv[0]);

    std::unique_ptr<TestType> testtype;

    srand(static_cast<unsigned>(time(0)));

    // If an argument was passed, assume it is the name of the test file which needs to be
    // confirmed to exist.  We also use the name to figure out what test type we are running
    if (argc > 1)
    {
        std::string test_file(argv[1]);

        std::ifstream f(test_file.c_str());
        file_found = f.good();

        testtype = make_test_type(test_file);
    }
    else
    {
        testtype = make_test_type(this_prog);
    }

    if (file_found && testtype)
    {
        std::cout << testtype->get_stdout();
        return testtype->get_exit_code();
    }

    // else...
    return -1;
}
