<?php

namespace Database\Seeders;

use App\Enums\Ask;
use App\Models\User;
use App\Enums\Status;
use App\Models\Address;
use App\Enums\Role as EnumRole;
use Illuminate\Database\Seeder;
use Dipokhalder\EnvEditor\EnvEditor;


class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        $envService = new EnvEditor();

        //admin
        $admin      = User::create([
            'name'              => 'Ahmed Nabil',
            'email'             => 'ahmed@gmail.com',
            'phone'             => '01016856433',
            'username'          => 'ahmed-nabil',
            'email_verified_at' => now(),
            'password'          => bcrypt('12345678'),
            'status'            => Status::ACTIVE,
            'country_code'      => '+20',
            'is_guest'          => Ask::NO
        ]);
        $admin->assignRole(EnumRole::ADMIN);
        if ($envService->getValue('DEMO')) {
            Address::create([
                'full_name'    => $admin->name,
                'email'        => $admin->email,
                'country_code' => $admin->country_code,
                'phone'        => $admin->phone,
                'country'      => "Egypt",
                'state'        => 'Cairo',
                'city'         => 'Maadi',
                'zip_code'     => '1209',
                'address'      => 'Zahraa Al Maadi',
                'user_id'      => $admin->id,
            ]);
            Address::create([
                'full_name'    => $admin->name,
                'email'        => $admin->email,
                'country_code' => $admin->country_code,
                'phone'        => $admin->phone,
                'country'      => "Egypt",
                'state'        => 'Cairo',
                'city'         => 'Maadi',
                'zip_code'     => '1209',
                'address'      => 'Zahraa Al Maadi',
                'user_id'      => $admin->id,
            ]);
        }

        //customer
        $customer = User::create([
            'name'              => 'Ahmed Customer',
            'email'             => 'ahmed@customer.com',
            'phone'             => '01141090116',
            'username'          => 'ahmed-customer',
            'email_verified_at' => now(),
            'password'          => bcrypt('12345678'),
            'status'            => Status::ACTIVE,
            'country_code'      => '+20',
            'is_guest'          => Ask::NO
        ]);
        $customer->assignRole(EnumRole::CUSTOMER);
        if ($envService->getValue('DEMO')) {
            Address::create([
                'full_name'    => $customer->name,
                'email'        => $customer->email,
                'country_code' => $customer->country_code,
                'phone'        => $customer->phone,
                'country'      => "Egypt",
                'state'        => 'Cairo',
                'city'         => 'Maadi',
                'zip_code'     => '1209',
                'address'      => 'Zahraa Al Maadi',
                'user_id'      => $customer->id,
            ]);
        }

        //demo
        if ($envService->getValue('DEMO')) {
            //customer
            $customerOne = User::create([
                'name'              => 'Customer',
                'email'             => 'customer@email.com',
                'phone'             => '01234567890',
                'username'          => 'customer',
                'email_verified_at' => now(),
                'password'          => bcrypt('12345678'),
                'status'            => Status::ACTIVE,
                'country_code'      => '+20',
                'is_guest'          => Ask::NO
            ]);
            $customerOne->assignRole(EnumRole::CUSTOMER);
            Address::create([
                'full_name'    => $customerOne->name,
                'email'        => $customerOne->email,
                'country_code' => $customerOne->country_code,
                'phone'        => $customerOne->phone,
                'country'      => "Egypt",
                'state'        => 'Cairo',
                'city'         => 'Maadi',
                'zip_code'     => '1209',
                'address'      => 'Zahraa Al Maadi',
                'user_id'      => $customerOne->id,
            ]);
            Address::create([
                'full_name'    => $customerOne->name,
                'email'        => $customerOne->email,
                'country_code' => $customerOne->country_code,
                'phone'        => $customerOne->phone,
                'country'      => "Bangladesh",
                'state'        => 'Dhaka District',
                'city'         => 'Dhaka',
                'zip_code'     => '1209',
                'address'      => 'House :30, Road: 13, Block: A, Dhanmondi 32',
                'user_id'      => $customerOne->id,
            ]);

            //employee
            $employeeOne = User::create([
                'name'              => 'Employee',
                'email'             => 'employee@email.com',
                'phone'             => '01234567891',
                'username'          => 'employee',
                'email_verified_at' => now(),
                'password'          => bcrypt('12345678'),
                'status'            => Status::ACTIVE,
                'country_code'      => '+20',
                'is_guest'          => Ask::NO
            ]);
            $employeeOne->assignRole(EnumRole::MANAGER);
            Address::create([
                'full_name'    => $employeeOne->name,
                'email'        => $employeeOne->email,
                'country_code' => $employeeOne->country_code,
                'phone'        => $employeeOne->phone,
                'country'      => "Egypt",
                'state'        => 'Cairo',
                'city'         => 'Maadi',
                'zip_code'     => '1209',
                'address'      => 'Zahraa Al Maadi',
                'user_id'      => $employeeOne->id,
            ]);

            /*
            $employeeTwo = User::create([
                'name'              => 'Shohag Ali',
                'email'             => 'shohag@example.com',
                'phone'             => '1257654433',
                'username'          => 'shohag-ali3324',
                'email_verified_at' => now(),
                'password'          => bcrypt('123456'),
                'status'            => Status::ACTIVE,
                'country_code'      => '+880',
                'is_guest'          => Ask::NO
            ]);
            $employeeTwo->assignRole(EnumRole::MANAGER);
            Address::create([
                'full_name'    => $employeeTwo->name,
                'email'        => $employeeTwo->email,
                'country_code' => $employeeTwo->country_code,
                'phone'        => $employeeTwo->phone,
                'country'      => "Bangladesh",
                'state'        => 'Dhaka District',
                'city'         => 'Dhaka',
                'zip_code'     => '1216',
                'address'      => 'House :30, Road: 4, Block: D, Mirpur 11',
                'user_id'      => $employeeTwo->id,
            ]);
            */

            //posOperator
            $posOperatorOne = User::create([
                'name'              => 'Pos Operator',
                'email'             => 'posoperator@email.com',
                'phone'             => '01234567892',
                'username'          => 'posoperator',
                'email_verified_at' => now(),
                'password'          => bcrypt('12345678'),
                'status'            => Status::ACTIVE,
                'country_code'      => '+20',
                'is_guest'          => Ask::NO
            ]);
            $posOperatorOne->assignRole(EnumRole::POS_OPERATOR);
            Address::create([
                'full_name'    => $posOperatorOne->name,
                'email'        => $posOperatorOne->email,
                'country_code' => $posOperatorOne->country_code,
                'phone'        => $posOperatorOne->phone,
                'country'      => "Egypt",
                'state'        => 'Cairo',
                'city'         => 'Maadi',
                'zip_code'     => '1209',
                'address'      => 'Zahraa Al Maadi',
                'user_id'      => $posOperatorOne->id,
            ]);

            /*
            $posOperatorTwo = User::create([
                'name'              => 'Sahataz Afnan',
                'email'             => 'sahataz@example.com',
                'phone'             => '1249955570',
                'username'          => 'sahataz-afnan232',
                'email_verified_at' => now(),
                'password'          => bcrypt('123456'),
                'status'            => Status::ACTIVE,
                'country_code'      => '+880',
                'is_guest'          => Ask::NO
            ]);
            $posOperatorTwo->assignRole(EnumRole::POS_OPERATOR);
            Address::create([
                'full_name'    => $posOperatorTwo->name,
                'email'        => $posOperatorTwo->email,
                'country_code' => $posOperatorTwo->country_code,
                'phone'        => $posOperatorTwo->phone,
                'country'      => "Bangladesh",
                'state'        => 'Dhaka District',
                'city'         => 'Dhaka',
                'zip_code'     => '1216',
                'address'      => 'House :10, Road: 2, Block: C, Mirpur 14',
                'user_id'      => $posOperatorTwo->id,
            ]);
            */

            //stuff
            $stuffOne = User::create([
                'name'              => 'Stuff',
                'email'             => 'stuff@email.com',
                'phone'             => '01234567893',
                'username'          => 'stuff',
                'email_verified_at' => now(),
                'password'          => bcrypt('12345678'),
                'status'            => Status::ACTIVE,
                'country_code'      => '+20',
                'is_guest'          => Ask::NO
            ]);
            $stuffOne->assignRole(EnumRole::STUFF);
            Address::create([
                'full_name'    => $stuffOne->name,
                'email'        => $stuffOne->email,
                'country_code' => $stuffOne->country_code,
                'phone'        => $stuffOne->phone,
                'country'      => "Egypt",
                'state'        => 'Cairo',
                'city'         => 'Maadi',
                'zip_code'     => '1209',
                'address'      => 'Zahraa Al Maadi',
                'user_id'      => $stuffOne->id,
            ]);

            /*
            $stuffTwo = User::create([
                'name'              => 'Kala Chan',
                'email'             => 'kala@example.com',
                'phone'             => '1238426043',
                'username'          => 'kala-chan890',
                'email_verified_at' => now(),
                'password'          => bcrypt('123456'),
                'status'            => Status::ACTIVE,
                'country_code'      => '+880',
                'is_guest'          => Ask::NO
            ]);
            $stuffTwo->assignRole(EnumRole::STUFF);
            Address::create([
                'full_name'    => $stuffTwo->name,
                'email'        => $stuffTwo->email,
                'country_code' => $stuffTwo->country_code,
                'phone'        => $stuffTwo->phone,
                'country'      => "Bangladesh",
                'state'        => 'Dhaka District',
                'city'         => 'Dhaka',
                'zip_code'     => '1209',
                'address'      => 'House :1, Road: 2, Block: A, Dhanmondi 27',
                'user_id'      => $stuffTwo->id,
            ]);
            */
        }
    }
}
