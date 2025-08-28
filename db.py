import os
import platform

def main():
    print("🔁 MySQL Dump/Load Tool")
    print("----------------------------")
    print("1. Dump (Export) MySQL Database")
    print("2. Load (Import) MySQL Database")
    print("0. Exit")
    
    choice = input("Select an option (1/2/0): ").strip()
    
    if choice == "0":
        print("👋 Exiting.")
        return

    db_name = input("Enter MySQL database name: ").strip()
    user = input("Enter MySQL username: ").strip()
    password = input("Enter MySQL password: ").strip()

    if choice == "1":
        output_file = input("Enter output filename (e.g., backup.sql): ").strip()
        print(f"📤 Dumping database '{db_name}' to '{output_file}'...")
        os.system(f"mysqldump -u {user} -p{password} {db_name} > {output_file}")
        print("✅ Dump completed.")

    elif choice == "2":
        sql_file = input("Enter SQL filename to import (e.g., backup.sql): ").strip()
        if not os.path.exists(sql_file):
            print("❌ File not found!")
            return
        print("💻 Platform Detected:", platform.system())
        confirm = input(f"⚠️ Are you sure you want to import '{sql_file}' into '{db_name}'? (yes/no): ").strip().lower()
        if confirm == "yes":
            os.system(f"mysql -u {user} -p{password} {db_name} < {sql_file}")
            print("✅ Import completed.")
        else:
            print("❌ Import cancelled.")
    else:
        print("❌ Invalid option selected.")

if __name__ == "__main__":
    main()
