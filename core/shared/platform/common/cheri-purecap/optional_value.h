/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

 /* optional_value.h: Very basic implementation of C++17's std::optional, as we are using C++14 or earlier */

#ifndef _OPTIONAL_VALUE_H_
#define _OPTIONAL_VALUE_H_

#include <utility>
#include <exception>
#include <string>
#include <ostream>

class OptionalValueError : public std::runtime_error
{
public:
    OptionalValueError(const std::string& msg = "") : std::runtime_error(msg) {}
};


template<typename T>
class OptionalValue
{
    T m_value;
    bool m_have_value;

public:
    OptionalValue() : m_value{}, m_have_value{ false } {}
    OptionalValue(const T &value) : m_value{value}, m_have_value{ true } {}
    OptionalValue(T &&value) : m_value{ std::move(value) }, m_have_value{ true } {}
    OptionalValue(const OptionalValue<T>&) = delete;
    OptionalValue& operator=(OptionalValue<T>&&) = delete;
    OptionalValue &operator=(const OptionalValue<T>&) = delete;

    bool HasValue() const noexcept { return m_have_value; }

    T Get() const
    {
        if (!m_have_value)
        {
            throw OptionalValueError{ "Value has not been set!" };
        }
        return m_value;
    }
    OptionalValue& operator=(const T &value)
    {
        m_value = value;
        m_have_value = true;
        return *this;
    }

    OptionalValue& operator=(T&& value)
    {
        m_value = std::move(value);
        m_have_value = true;
        return *this;
    }

    // Set the value only if it does not already have one
    void SetIfEmpty(const T& value)
    {
        if (!m_have_value)
        {
            m_value = value;
            m_have_value = true;
        }
    }

    void SetIfEmpty(const T&& value)
    {
        if (!m_have_value)
        {
            m_value = std::move(value);
            m_have_value = true;
        }
    }

    friend std::ostream & operator<<(std::ostream& ostr, const OptionalValue<T>& opt)
    {
        ostr << (opt.HasValue() ? opt.m_value : "<optional NoValue>");
        return ostr;
    }
        
};

#endif /* _OPTIONAL_VALUE_H_ */
